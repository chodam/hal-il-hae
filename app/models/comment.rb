class Comment < ActiveRecord::Base
    belongs_to :todo_list
end