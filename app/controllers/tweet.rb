get '/users/:id/tweet' do
  @user = User.find(params[:id])
  erb :tweet
end

post '/users/:id/tweet' do
  @user = User.find(params[:id])
  tweet = Tweet.new(content: params[:content], user_id: params[:id])
  if tweet.save
    redirect "/users/#{@user.id}"
  else
    status 400
    @content = params[:content]
    @error = tweet.errors.full_messages.to_sentence
    erb :tweet
  end
end
