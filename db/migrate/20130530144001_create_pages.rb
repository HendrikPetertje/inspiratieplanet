class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

    	t.text :about	
    	t.text :privacy
    	t.text :contact

      t.timestamps
    end
  end
end
