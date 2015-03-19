get '/' do
  if current_user
   erb :test
  else
    redirect "/users/new"
  end
end

get '/users/new' do
  @user=User.new
  erb :signup
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/"
  else
    erb :signup
  end
end
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
  redirect '/sessions/new'
end
