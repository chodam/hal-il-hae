class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.datetime :date
      t.integer :done

      t.timestamps null: false
    end
  end
end
