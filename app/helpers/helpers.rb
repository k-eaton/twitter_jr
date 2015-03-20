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

end
