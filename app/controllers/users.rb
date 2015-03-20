#rename to users.rb

get '/users/new' do
@user=User.new
  erb :signup
end

post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/"
  else
    erb :signup
  end
end

get '/users/find' do
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
  erb :profile_page
end
