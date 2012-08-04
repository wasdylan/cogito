class Post < ActiveRecord::Base
  attr_accessible :content, :source, :tags, :title, :topic, :user_id

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :agrees, :dependent => :destroy
end
