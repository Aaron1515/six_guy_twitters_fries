# get '/users/:id/tweet' do
#   # erb :'/tweets'
# end

post '/users/:id/tweet' do
  p params
  @user = User.find_by_id(params[:id])
  # @tweets = Tweet.where(user_id: @user.id)
  @tweet = Tweet.create(user_id: params[:id], content: params[:content])
  # erb :'users/users'
  redirect "/users/#{@user.id}"
end

delete '/users/:id/tweet/:id' do
  # binding.pry
  @tweet = Tweet.find_by_id(params[:id])
  @tweet.destroy
  # "Hello World"
  redirect "/users/#{params["captures"][0]}"
end
