# get '/tweet' do
#   erb :tweet
# end

post '/tweet' do
  tweet = Tweet.new(content: params[:content], user_id: current_user.id)
  if tweet.save
    redirect "/users/#{current_user.id}"
  else
    status 400
    @user = User.find(current_user.id)
    @content = params[:content]
    @error = tweet.errors.full_messages.to_sentence
    erb :profile_page #confusing, need to figure out a better place
  end
end
