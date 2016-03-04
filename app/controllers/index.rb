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
