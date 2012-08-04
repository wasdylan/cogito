class UsersController < ApplicationController
  def profile
  
	  @username = params[:id]
	  @user = User.find_by_username(@username) # get user information
	  
	  @posts = Post.where(:user_id => @user.id) # get all the user's posts for the blog as well as activity stream
	  @comments = Comment.where(:user_id => @user.id) # get all the users comments for the activity stream
    @agrees = Agree.where(:user_id => @user.id) # get all the users agreements for the activity stream
	  @activities = (@posts + @comments + @agrees).sort_by(&:created_at) # combine user's activities and sort them for the stream
	  @activites = @activities.reverse!
	  @posts = @posts.reverse!
	  	  
	  respond_to do |format|
      	format.html # profile.html.erb
      	format.json { render :json => @posts }
      end
    
  end
  
end
