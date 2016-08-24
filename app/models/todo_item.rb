class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  after_update :update_done
  
  mount_uploader :image_url, DonepicUploader
  
  def completed?
    !completed_at.blank?
  end
  
  def update_done
    todo_list = self.todo_list
    todo_list.update(done: todo_list.todo_items.where(clear: true).count)
  end
end
