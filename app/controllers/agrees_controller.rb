class AgreesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
	load_and_authorize_resource
  
  def create
    @agree = Agree.new(params[:agree])
    @agree.user = current_user
    @agree.post = Post.find(params[:post_id])
    
    if @agree.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@agree.post)
    else
      flash[:notice] = "Error creating comment: #{@agree.errors}"
      redirect_to(@agree.post)
    end
  end
 
  def destroy
    @agree = Agree.find(params[:id])
    @agree.destroy
 
    redirect_to(@agree.post)
  end

end
