class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string  :title, null: false
      t.text    :description
      t.string  :category, null: false
      t.string  :html, null: false
      t.string  :css, null: false
      t.string  :js
      
      t.integer :author_id, null: false

      t.timestamps null: false
    end
  end
end
