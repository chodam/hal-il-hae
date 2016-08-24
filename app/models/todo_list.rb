class TodoList < ActiveRecord::Base
  has_many :todo_items
  has_many :comments
  belongs_to :user
end
