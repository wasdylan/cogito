class UsersController < ApplicationController
  def profile
  
	  @username = params[:id]
	  @user = User.find_by_username(@username) # get user information
	  
	  @posts = Post.where(:user_id => @user.id) # get all the user's posts for the blog as well as activity stream
	  @comments = Comment.where(:user_id => @user.id) # get all the users comments for the activity stream
    @agrees = Agree.where(:user_id => @user.id) # get all the users agreements for the activity stream
	  @activities = (@posts + @comments + @agrees).sort_by(&:created_at) # combine user's activities and sort them for the stream
	  @activites = @activities.reverse!

		@following = Relationship.where(:follower_id => @user.id)
    @following_count = @following.count
		@followers = Relationship.where(:followed_id => @user.id)
    @followers_count = @followers.count

    @isfollowing = Relationship.exists?(:followed_id => @user.id, :follower_id => current_user)
    @relationship = Relationship.find_by_followed_id_and_follower_id(@user.id, current_user)
	  	  
	  respond_to do |format|
      	format.html # profile.html.erb
      	format.json { render :json => @posts }
      end
    
  end

	def show
		@id = params[:id]
		@user = User.find_by_id(@id)	
		@url = "../user/"+@user.username
		redirect_to(@url = "/user/"+@user.username)
	end
  
end
