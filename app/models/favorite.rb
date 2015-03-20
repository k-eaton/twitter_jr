class Favorite < ActiveRecord::Base
  belongs_to :favorite_users, :class_name => "User", :foreign_key => "user_id"
  belongs_to :favorite_tweets, :class_name => "Tweet", :foreign_key => "tweet_id"

  def toggle_favorite(input_user)
    if Tweet.where(id: input_tweet.id).first.favorites.empty?
    else
    end 
  end 
end
