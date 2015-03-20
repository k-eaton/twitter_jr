#rename to users.rb

get '/users/new' do
  @user=User.new
  erb :'users/signup'
end

post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/"
  else
    erb :'users/signup'
  end
end

get '/users/edit' do
  erb :'users/edit'
end


post '/users/edit' do
  @user = current_user
  @user.name = params[:user][:name]
  @user.handle = params[:user][:handle]
  @user.email = params[:user][:email]
  @user.password = params[:user][:password]
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'users/edit'
  end
end

get '/users/find' do
  @users=User.all
  erb :'users/find'
end

post '/users/find' do
  @user = User.where(handle: params[:handle].downcase).first
  if @user
    redirect "/users/#{@user.id}"
  else
    @error = "User not found"
    erb :'users/find'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end

get '/users/:id/followees' do
  @user=User.where(id:params[:id])[0]
  erb :"users/show_followees"
end

get '/users/:id/followers' do
  @user=User.where(id:params[:id])[0]
  erb :"users/show_followers"
end

post '/users/:id' do
  @user=User.where(id: params[:id])[0]
  current_user.toggle_follow(@user)
  redirect "users/#{@user.id}"
end

