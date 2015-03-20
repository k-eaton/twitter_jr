class User < ActiveRecord::Base

  has_many :tweets

  has_many :favorites
  has_many :favorite_tweets, :through => :favorites

  has_many :actively_following, :class_name => "Follow", :foreign_key => "user_id"
  has_many :being_followed, :class_name => "Follow", :foreign_key => "subscribed_to_id"
  has_many :followees, :through => :actively_following
  has_many :followers, :through => :being_followed

  include BCrypt
  validates :email, :handle, presence:true
  validate :correct_email_format
# getter method:
def password
  @password ||= Password.new(password_hash)
end

# setter method:
def password=(new_password)
  @password = Password.create(new_password)
  self.password_hash = @password
end

def authenticate(input_password)
  self.password == input_password
end

def correct_email_format
  self.errors.add :base, "Incorrect email address format" unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.match(self.email)
end

def followee_tweets
  tweets = []
  self.followees.each do |followee|
    followee.tweets.each do |tweet|
      tweets << tweet
    end
  end
  tweets.sort { |x, y| y.created_at <=> x.created_at }
end

def toggle_follow(profile_user)
  if Follow.where(user_id: self.id, subscribed_to_id: profile_user.id).empty?
    Follow.create(user_id: self.id, subscribed_to_id: profile_user.id)
  else
    Follow.where(user_id: self.id, subscribed_to_id: profile_user.id).first.destroy
  end
end


end
