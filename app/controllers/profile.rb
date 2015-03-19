get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile_page
end

