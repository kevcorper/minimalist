class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
    	t.text :code, null: false

    	t.integer :author_id, null: false

      t.timestamps null: false
    end
  end
end