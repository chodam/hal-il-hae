class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :todo_list_id

      t.timestamps null: false
    end
  end
end
