get '/tweets/new' do
  erb :'tweets/new'
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
    erb :'tweets/new'
  end
end

get '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  erb :'tweets/show'
end

get '/tweets/:id/retweet' do
  tweet = Tweet.find(params[:id])
  @content = "#{tweet.content} @#{tweet.user.handle}"
  erb :'tweets/new'
end

get '/tweets/:id/reply' do
  tweet = Tweet.find(params[:id])
  @content = "@#{tweet.user.handle} "
  erb :'tweets/new'
end