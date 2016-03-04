get '/' do # homepage login page
  redirect '/login'
end

get '/login' do # homepage login page
  erb :index
end


get '/users/new' do # get to register page
  erb :new
end

post '/users/new' do
  @user = User.create(name: params[:username], email: params[:email], password: params[:password])
  @message = "You can log in with your account now."
  erb :index
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    seccsion[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @message = "Email and Password not match. Please try again."
    erb :index
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

post '/' do # Log out
  session[:id] = nil
  redirect '/login'
end