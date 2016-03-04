get '/users' do
#display all user
  erb :'users/index'
end

get '/users/new' do
  erb :new
end

post '/users' do
  #need to make sure what the var is called.
  # @user = User.create(user: params["username"], password: params["password"])
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

  erb :'users/index'
end

get '/users/:id/edit' do
  # erb :'users/edit'
end

put '/users/:id' do
#update the user's profile into the DB
end

delete '/users' do
  # @user = User.find(param[:id])
  redirect '/'
end