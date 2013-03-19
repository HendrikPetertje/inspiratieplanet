class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.string :tags
      t.integer :user_id

      t.timestamps
    end
  end
end
