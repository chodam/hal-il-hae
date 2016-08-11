class CommentsController < ApplicationController
  def comment
    @comment = Comment.new
    @comment.content = params[:comment]
    @comment.todo_list_id = params[:id_of_todo_list]
    @comment.save
    redirect_to "/todo_lists/:todo_list_id"
    #혜지 파이팅
  end
end
