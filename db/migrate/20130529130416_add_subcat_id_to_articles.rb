class AddSubcatIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :subcat_id, :integer
  end
end
