class Favorite < ActiveRecord::Base
  belongs_to :favorite_users, :class_name => "User", :foreign_key => "user_id"
  belongs_to :favorite_tweets, :class_name => "Tweet", :foreign_key => "tweet_id"
end
