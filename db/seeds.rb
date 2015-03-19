require 'faker'

5.times do
 user = User.create(name: Faker::Name.name, email: Faker::Internet.email, handle: Faker::Name.first_name.downcase)

 5.times {user.tweets.create(content: Faker::Lorem.sentence)}
end


