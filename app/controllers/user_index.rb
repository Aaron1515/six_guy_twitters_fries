get '/users' do
  #display all user
  @users = User.all
  erb :'users/index'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:plaintext_password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/'
  end
end


get '/users/:id' do
  @user = User.find_by_id(params[:id])
  @session = session[:id]
  if @user # if user exist in the database (not nil)
    if session[:id] != nil # Check if session id is matching with the user id
      @tweets = Tweet.where(user_id: @user.id)
      erb :'/users/users' # This render the content for specific user. Also suggesting to change name to /users/user_homepage
    else
      redirect '/' # redirect back to home page if session id doesn't match
    end
  else
    @message = "User not found!" # Create message for what goes wrong for user when returning back to homepage
    erb :index # Render the index page with the message
  end
end

























# get '/users' do
# #display all user
#   erb :'users/index'
# end

# post '/users/login' do
#     # @user = User.find_by(email: params[:email])
#   # if @user.authenticate(params[:password])
#   #   seccsion[id] = @user.id
#   #   "I got in"
#   # else
#   #   "I'm locked out"
#   # end

#   # if User.authenticate(params[:email], params[:password])
#   "If log in is true, move to user page"
#   #   @user = User.find_by(email: params[:email])
#   #   session[:id] = @user.id
#   #   redirect "/users/#{@user.id}"
#   # else
#   #   @message = "message"
#   # redirect :'users/:id'
# end

# get '/users/:id' do
#   @user = User.find(params["id"])
#   erb :'users/users'
# end

# get '/users/:id/edit' do
#   @user = User.find(params["id"])
#   erb :'users/edit'
# end



# delete '/users' do
#   User.find(param[:id]).destroy
#   redirect '/'
# end
