class RelationshipsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
	load_and_authorize_resource
  
  def create
    @relationship = Relationship.new(params[:relationship])
    @relationship.follower = current_user
    @relationship.followed = User.find(params[:user_id])
    
    if @relationship.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@relationship.followed)
    else
      flash[:notice] = "Error creating comment: #{@relationship.errors}"
      redirect_to(@relationship.followed)
    end
  end
 
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
 
    redirect_to(@relationship.followed)
  end

end
