class HomeController < ApplicationController
  def index
    @users = User.all
  end

	def stream
		@feed_items = current_user.feed

		@popular = Agree.popular
	end
end
