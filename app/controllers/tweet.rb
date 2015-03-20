get '/tweets/new' do
  erb :'tweet/new'
end

post '/tweets/new' do
  tweet = Tweet.new(content: params[:content], user_id: current_user.id)
  if tweet.save
    redirect "/users/#{current_user.id}"
  else
    status 400
    @user = User.find(current_user.id)
    @content = params[:content]
    @error = tweet.errors.full_messages.to_sentence
    erb :'tweet/new'
  end
end

get '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  erb :'tweet/show'
end

get '/tweets/:id/retweet' do
  tweet = Tweet.find(params[:id])
  @content = "#{tweet.content} @#{tweet.user.handle}"
  erb :'tweet/new'
end