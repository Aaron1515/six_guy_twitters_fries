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