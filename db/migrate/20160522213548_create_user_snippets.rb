class CreateUserSnippets < ActiveRecord::Migration
  def change
    create_table :user_snippets do |t|
      t.integer :user_id, null: false
      t.integer :snippet_id, null: false

      t.timestamps null: false
    end
  end
end
