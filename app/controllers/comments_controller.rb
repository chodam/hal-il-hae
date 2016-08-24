class CommentsController < ApplicationController
  before_action :set_comment, except: [:create]
  before_action :set_todo_list
  
  # 닉네임 띄우려면... < 이거 다시 고민해
  def create
    @comment = @todo_list.comments.new(comment_params)

    respond_to do |wants|
      if @comment.save
        # flash[:notice] = 'Comment was successfully created.'
        wants.html { redirect_to(@todo_list) }
        wants.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end

  end
  
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def destroy
    @todo_list = current_user.todo_lists.find(params[:todo_list_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment was deleted"
    else
      flash[:error] = "error"
    end
    redirect_to @todo_list
  end
  
  private
  
  def set_todo_list
    @todo_list = current_user.todo_lists.find(params[:todo_list_id])
  end
  
  def set_comment
    @todo_item = Comment.find(params[:id])
  end
  
  def comment_params
      params.require(:comment).permit(:content)
  end
end