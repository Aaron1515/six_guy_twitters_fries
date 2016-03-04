get '/' do # homepage login page
  erb :index
end

# post '/' do # Logout
#   session[:id] = nil
#   redirect '/login'
# end

get '/login' do # homepage login page
  erb :index
end


get '/users/new' do # get to register page
  erb :new
end

post '/users/new' do
  @user = User.create(username: params[:username], email: params[:email], password: params[:password])
  @message = "You can log in with your account now."
  erb :index
end

# post '/users/login' do
#   @user = User.find_by(email: params[:email])
#   if @user.authenticate(params[:password])
#     seccsion[:id] = @user.id
#     redirect "/users/#{@user.id}"
#   else
#     @message = "Email and Password not match. Please try again."
#     erb :index
#   end
# end


# get '/new' do
#   erb :new
# end

# post '/' do
#   #User.create(user: params["username"], password: params["password"])
#   erb :'users/user'
# end
