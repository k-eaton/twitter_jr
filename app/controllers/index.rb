get '/' do
  @user=User.new
  logged_in? ? (erb :index) : (erb :signin)
end
