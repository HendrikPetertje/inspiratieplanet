class AddFavcountToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :favorites_count, :integer, :default => 0
    
    Article.reset_column_information
    Article.all.each do |p|
      p.update_attribute :favorites_count, p.favorites.length
    end
  end

  def self.down
    remove_column :articles, :favorites_count
  end
end
