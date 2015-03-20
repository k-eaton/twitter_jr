#rename to users.rb

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

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile_page
end

get '/users/:id/followees' do
  @user=User.where(id:params[:id])[0]
  erb :show_followees
end

get '/users/:id/followers' do
  @user=User.where(id:params[:id])[0]
  erb :show_followers
end
