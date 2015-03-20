get '/' do
  logged_in? ? (erb :index) : (erb :signin)
end
