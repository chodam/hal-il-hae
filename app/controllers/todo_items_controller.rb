class TodoItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list, except: [:upload]
  before_action :set_todo_item, except: [:create, :upload]
  
  def create
    @todo_list.todo_items.create(todo_item_params)
    redirect_to :back
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
    #@todo_item = TodoItem.find(params[:id])
    #@todo_clear = TodoList.find(params[:id])
    #@todo_item.update(image_url: params[:pic])

    @todo_item.update_attribute(:completed_at, Time.now)  ##사진 저장 완료되면 할일 완료로 처리되는 부분
    #@todo_clear.current_user.done += 1                    ##할일 완료되면 todo_list.done(클리어 개수)이 1씩 증가
    flash[:notice]="donepic업로드완료"
    redirect_to @todo_list, notice: "Todo item completed"

  end
  
  def upload
    # uploader = DonepicUploader.new
    # uploader.store!(params[:pic])         
    # @todo_item.image_url = uploader.url
    todo_item = TodoItem.find(params[:id])
    todo_item.update(image_url: params[:pic])
    
    if todo_item.image_url.present?
      todo_item.update(completed_at: Time.now, clear: true)
      flash[:notice]="donepic업로드완료"
      redirect_to :back, notice: "Todo item completed"
	  else
      redirect_to :back
    end
  end
  

  private

  def set_todo_list
    @todo_list = current_user.todo_lists.find(params[:todo_list_id])
  end
  
  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end
  
  def todo_item_params
    #params[:todo_item].permit(:item)
    params.require(:todo_item).permit(:item)
  end
  
  def set_time
    @date_time = Time.now
  end
end