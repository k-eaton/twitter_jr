get '/find_user' do
  erb :find_user
end

post '/find_user' do
  @user = User.where(handle: params[:handle].downcase).first
  if @user
    redirect "/users/#{@user.id}"
  else
    @error = "User not found"
    erb :find_user
  end
end
