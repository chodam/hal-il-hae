class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :item
      t.integer :clear
      t.string :image_url
      t.references :todo_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
