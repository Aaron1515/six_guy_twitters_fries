get '/users' do
#display all user
  erb :'users/index'
end

get '/users/new' do
#goes to new user form
  erb :'users/new'
end

post '/users' do
#create new user into our db
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