class AddAdminNameAndPictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :picture, :string
    add_column :users, :admin, :boolean
  end
end
