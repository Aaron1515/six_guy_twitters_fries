get '/' do
  erb :index
end

get '/new' do
  erb :new
end

post '/' do
  #User.create(user: params["username"], password: params["password"])
  erb :'users/user'
end

get '/test_less' do
	erb :'test_less'
end

# post '/' do
#   #User.create(user: params["username"], password: params["password"])
#   erb :'users/user'
# end

get '/users/index' do
  erb :'/users/index'
end

get '/users/edit' do
	erb :'/users/edit'
end

get '/users/followers' do
	erb :'/users/followers'
end

get '/users/followees' do
	erb :'/users/followees'
end

get '/users/users' do
	erb :'/users/users'
end