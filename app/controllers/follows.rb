get '/users/:id/followers' do
  p '=' * 50
  @user = User.find(params[:id])
  @followers = @user.followers
  erb :'/users/followers'
end

get '/users/:id/followees' do
  p '?' * 50
  @user = User.find(params[:id])
  @followees = @user.followees
  erb :'/users/followees'
end

post '/users/:id/follow' do
  @current_user = User.find(session[:id])
  if session[:id] != params[:id]
    @current_user.follow(params[:id])
    @current_user.save
  end
    redirect "/users/#{params[:id]}"
end