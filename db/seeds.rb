# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed molestie in ante a tincidunt. Ut ullamcorper, nibh accumsan vestibulum vehicula, dolor tortor lobortis mi, non maximus nunc est vel erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam pretium molestie ipsum, in hendrerit libero rutrum nec. Etiam vel ullamcorper orci. Etiam condimentum eget felis eu euismod. Donec posuere, dui nec laoreet vulputate, nunc eros tincidunt nulla, quis scelerisque nisi orci et enim. Curabitur posuere tempus odio, at volutpat ex. Integer sollicitudin mauris eu enim suscipit ornare. Aliquam consectetur dui eget urna blandit, quis bibendum libero interdum. Vestibulum vitae elit urna. Integer sodales enim sed sapien accumsan, vel convallis mi faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer faucibus lobortis dictum.\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed molestie in ante a tincidunt. Ut ullamcorper, nibh accumsan vestibulum vehicula, dolor tortor lobortis mi, non maximus nunc est vel erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam pretium molestie ipsum, in hendrerit libero rutrum nec. Etiam vel ullamcorper orci. Etiam condimentum eget felis eu euismod. Donec posuere, dui nec laoreet vulputate, nunc eros tincidunt nulla, quis scelerisque nisi orci et enim. Curabitur posuere tempus odio, at volutpat ex. Integer sollicitudin mauris eu enim suscipit ornare. Aliquam consectetur dui eget urna blandit, quis bibendum libero interdum. Vestibulum vitae elit urna. Integer sodales enim sed sapien accumsan, vel convallis mi faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer faucibus lobortis dictum."

User.create(username: "Ben_Sullivan", password: "password", password_confirmation: "password")
User.create(username: "Ben_Brower", password: "hunter2", password_confirmation: "hunter2")
User.create(username: "John_Siracusa", password: "APFS", password_confirmation: "APFS")
User.create(username: "Marco", password: "podcasts_gud", password_confirmation: "podcasts_gud")
User.create(username: "Liss_is_More", password: "velveeta", password_confirmation: "velveeta")

Post.create(title: "First Post", content: lorem, user_id: 1)
Post.create(title: "Second Post", content: lorem, user_id: 2)
Post.create(title: "Hypercritical", content: lorem, user_id: 3)
Post.create(title: "Second First Post", content: lorem, user_id: 1)
Post.create(title: "Creating a Podcast", content: lorem, user_id: 4)
Post.create(title: "How Bad Thing Is Actually Good", content: lorem, user_id: 5)

Topic.create(name: "technolgy")
Topic.create(name: "sports")
Topic.create(name: "books")
Topic.create(name: "cooking")
Topic.create(name: "boardgames")
Topic.create(name: "politics")
Topic.create(name: "entertainment")

7.times do
    PostTopic.create(topic_id: rand(1..7), post_id: rand(1..6))
    Feed.create(user_id: rand(1..5), topic_id: rand(1..7))
    Feed.create(user_id: rand(1..5), topic_id: rand(1..7))
end


