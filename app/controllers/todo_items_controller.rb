class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]
  
  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end
    
  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo list item was deleted"
    else
      flash[:error] = "error"
    end
      redirect_to @todo_list
  end

  def complete
    file = params[:pic]
    
    uploader=DonepicUploader.new
    uploader.store!(file)
    TodoItem.image_url = uploader.url
    @todo_pic=TodoItem.image_url
    
    if @todo_pic.save
      flash[:notice]="donepic업로드완료"
      @todo_item.update_attribute(:completed_at, Time.now)
	  redirect_to @todo_list, notice: "Todo item completed"
	else
	  redirect_to @todo_list
    end
  end

  private
  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end
  
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
  
  def todo_item_params
    params.require(:todo_item).permit(:item)
  end
end