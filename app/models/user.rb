require 'bcrypt'

class User < ActiveRecord::Base

	include BCrypt

	validates :email, presence: true, uniqueness: true


  # Passive relationship join table (is followed by...)
  has_many :follower_followerships, foreign_key: :followee_id, class_name: :Followership, dependent: :destroy

  #Has many followers
  has_many :followers, through: :follower_followerships, source: :follower

  #Active relationship join table (is following...)
  has_many :followee_followerships, foreign_key: :follower_id, class_name: :Followership, dependent: :destroy

  #Is following many people
  has_many :followees, through: :followee_followerships, source: :followee

  #Has many tweets
  has_many :tweets, dependent: :destroy 

  #USER METHODS

  #Follow a user by id
  def follow(other_user_id)
  	user_to_follow = User.find_by(id: other_user_id)
    followee_followerships.create(followee_id: user_to_follow.id)
  end


  #Unfollow a user by id
  def unfollow(other_user_id)
   	user_to_unfollow = User.find_by(id: other_user_id)
    active_relationships.find_by(followed_id: user_to_unfollow.id).destroy
  end

  def following?(other_user_id)
  	user_to_lookup = User.find_by(id: other_user_id)
    followees.include?(user_to_lookup)
  end

  

  #display encrypted password
  def password
    @password ||= Password.new(digest_password)
  end

  #change password and encrypt
  def password=(new_password)
    @password = Password.create(new_password)
    self.digest_password = @password
  end
  #authenticate user
  def authenticate(plaintext_password)
  	self.password == plaintext_password
  end

end

