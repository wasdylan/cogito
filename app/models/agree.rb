class Agree < ActiveRecord::Base
  attr_accessible
  
  belongs_to :user
  belongs_to :post
end
