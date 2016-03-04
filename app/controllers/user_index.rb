get '/users' do
  #display all user
  @users = User.all
  erb :'users/index'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    seccsion[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @message = "Email and Password not match. Please try again."
    erb :'users/index'
  end

  # # if User.authenticate(params[:email], params[:password])
  # "If log in is true, move to user page"
  #   @user = User.find_by(email: params[:email])
  #   session[:id] = @user.id
  #   redirect "/users/#{@user.id}"
  # else
  #   @message = "Email and Password not match. Please try again."
  #   erb :'users/index'
  # end
end



get '/users/:id' do
  @user = User.find_by_id(params[:id])
  if @user # if user exist in the database (not nil)
    if session[:id] == true # Check if session id is matching with the user id
      erb :users # This render the content for specific user. Also suggesting to change name to /users/user_homepage
    else
      redirect '/' # redirect back to home page if session id doesn't match
    end
  else
    @message = "User not found!" # Create message for what goes wrong for user when returning back to homepage
    erb :index # Render the index page with the message
  end
end

get '/users/:id/edit' do # get to the edit form specific user
  @user = User.find_by_id(params[:id])
  erb :'users/edit'
end


put '/users/:id' do # Update a specific user (action)
  @user = User.find_by_id(params[:id])
  # Update the attributes of user's choice
  @user.assign_attributes(column: params["attributes"])
  if @user.save
    redirect '/users/index'
  else
    @message = "Error. Please try again." # Create message for what goes wrong for user when returning back to homepage
    erb :'users/edit'
  end
end

delete '/users' do
  User.find_by_id(param[:id]).destroy
  redirect '/'
end