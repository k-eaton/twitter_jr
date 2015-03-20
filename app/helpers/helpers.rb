helpers do
  def current_user
    @current_user || User.where(id: session[:id]).first if session[:id]
  end

  def logged_in?
    !!current_user
  end

  # def show_tweet(tweet)
  #   "Date: #{tweet.created_at.strftime('%b %d')}<br />
  #    By: @#{tweet.user.handle}<br />
  #    #{tweet.content}<br />
  #    <a href='/tweets/#{tweet.id}/reply'>Reply</a> <a href='/tweets/#{tweet.id}/retweet'>Retweet</a>"
  # end

  def is_not_a_follower?(profile_user)
   Follow.where(user_id: current_user.id, subscribed_to_id: profile_user.id).empty?
  end

  def is_not_favorited?(input_tweet)
   Tweet.where(id: input_tweet.id).first.favorites.empty?
  end

end
