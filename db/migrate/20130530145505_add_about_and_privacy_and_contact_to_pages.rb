class AddAboutAndPrivacyAndContactToPages < ActiveRecord::Migration
  def change
    add_column :pages, :about, :text
    add_column :pages, :privacy, :text
    add_column :pages, :contact, :text_
  end
end
