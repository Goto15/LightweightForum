# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Ben Sullivan")
User.create(username: "Ben Brower")

Post.create(title: "Test Post", content: "Test post don't upvote", user_id: 1)
Topic.create(name: "Test Topics")

PostTopic.create(topic_id: 1, post_id: 1)