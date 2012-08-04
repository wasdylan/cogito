class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.post)
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to(@comment.post)
  end
end
