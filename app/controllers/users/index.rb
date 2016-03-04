get '/users' do
#display all user
  erb :'users/index'
end

get '/users/new' do
#goes to new user form
  erb :'users/new'
end

post '/users' do
  # @user = User.find_by(email: params[:email])
  # if @user.authenticate(params[:password])
  #   seccsion[id] = @user.id
  #   "I got in"
  # else
  #   "I'm locked out"
  # end


  # if User.authenticate(params[:email], params[:password])
  #   @user = User.find_by(email: params[:email])
  #   session[:id] = @user.id
  #   redirect "/users/#{@user.id}"
  # else
  #   @message = "message"
  #   erb :"users/index"
  # end
end

get '/users/:id' do
# Shows user's profile
end

get '/users/:id/edit' do
# Brings you to edit form to update profile
end

put '/users/:id' do
#update the user's profile into the DB
end

delete '/users' do
#delete the user from our DB
end