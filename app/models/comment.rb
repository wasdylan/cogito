class Comment < ActiveRecord::Base
  attr_accessible :comment, :post_id, :user_id
end
