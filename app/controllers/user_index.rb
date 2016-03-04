get '/users' do
#display all user
  erb :'users/index'
end

post '/users/login' do
    # @user = User.find_by(email: params[:email])
  # if @user.authenticate(params[:password])
  #   seccsion[id] = @user.id
  #   "I got in"
  # else
  #   "I'm locked out"
  # end

  # if User.authenticate(params[:email], params[:password])
  "If log in is true, move to user page"
  #   @user = User.find_by(email: params[:email])
  #   session[:id] = @user.id
  #   redirect "/users/#{@user.id}"
  # else
  #   @message = "message"
  # redirect :'users/:id'
end

get '/users/:id' do
  @user = User.find(params["id"])
  erb :'users/users'
end

get '/users/:id/edit' do
  @user = User.find(params["id"])
  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find(params["id"])
  @user.assign_attributes(what_we_are_upding: params["thing we updating"])
  if @user.save
    redirect '/users/index'
  else
    erb :error
  end
end

delete '/users' do
  User.find(param[:id]).destroy
  redirect '/'
end