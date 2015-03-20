require 'faker'

5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, handle: Faker::Name.first_name.downcase, image: Faker::Avatar.image(slug = nil, size = '300x300', format = 'png'))

  5.times {user.tweets.create(content: Faker::Lorem.sentence)}
end

Follow.create(user_id: 1, subscribed_to_id: 2)
Follow.create(user_id: 1, subscribed_to_id: 3)
Follow.create(user_id: 1, subscribed_to_id: 4)
Follow.create(user_id: 1, subscribed_to_id: 5)
Follow.create(user_id: 2, subscribed_to_id: 5)
Follow.create(user_id: 3, subscribed_to_id: 5)
Follow.create(user_id: 4, subscribed_to_id: 5)
Follow.create(user_id: 3, subscribed_to_id: 4)



