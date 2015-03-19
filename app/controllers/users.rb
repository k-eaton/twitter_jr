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

