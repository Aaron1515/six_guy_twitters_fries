get '/tweets' do
#display all tweet
  erb :'tweets/index'
end

get '/tweets/new' do
#goes to new tweet form
  erb :'tweets/new'
end

post '/tweets' do
#create new tweet into our db
end

get '/tweets/:id' do
# Shows tweet's profile
end

get '/tweets/:id/edit' do
# Brings you to edit form to update profile
end

put '/tweets/:id' do
#update the tweet's profile into the DB
end

delete '/tweets' do
#delete the tweet from our DB
end