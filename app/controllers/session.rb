get '/sessions/new' do
  @user=User.new
  erb :signin
end

post '/sessions' do
  @user = User.where(handle: params[:handle])[0]
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/"
  else
    @errors="your login credentials failed"
    erb :signin
  end
end

delete '/sessions/logout' do
  session[:id] = nil
  redirect '/'
end
