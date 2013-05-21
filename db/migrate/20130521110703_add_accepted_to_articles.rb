class AddAcceptedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :accepted, :boolean, :default => false
  end
end
