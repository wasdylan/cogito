class FeedbackController < ApplicationController
  def index

		@user = current_user

		@comments = Comment.joins(:post).where(:posts => { :user_id => @user.id })
		@agrees = Agree.joins(:post).where(:posts => { :user_id => @user.id })

		@feedbacks = (@comments + @agrees).sort_by(&:created_at) # combine user's activities and sort them for the stream
	  @feedbacks = @feedbacks.reverse!

  end
end
