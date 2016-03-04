# User.create(users: ,follower_ship:, password:,  email:)

#Users
# User.create!(username:  "Test User",
#              email: "test@test.com",
#              password: "test",
#              bio: "this is a test")

99.times do |n|
  username  = Faker::Name.name
  email = Faker::Internet.free_email
  password = Faker::Lorem.word
  bio = Faker::Lorem.sentence(5)
  User.create!(username: username,
               email: email,
               password: password,
               bio: bio)
end

# tweets
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
followees = users[2..50]
followers = users[3..40]
followees.each { |followee| user.follow(followee) }
followers.each { |follower| follower.follow(user) }