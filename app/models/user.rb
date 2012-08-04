class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :username, :fullname, :bio, :remember_me
  
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :agrees, :dependent => :destroy
  has_many :relationships, :foreign_key => :follower_id, :dependent => :destroy
	has_many :followed_users, :through => :relationships, :source => :followed
	has_many :reverse_relationships, :foreign_key => :followed_id, :class_name => :Relationship, :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
end
