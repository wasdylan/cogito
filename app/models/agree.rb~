class Agree < ActiveRecord::Base
  attr_accessible
  
  belongs_to :user
  belongs_to :post
	

	scope :popular, select("post_id, count(post_id) as count").group(:post_id).order("count desc").limit(3)

end
