#db/seeds.rb
puts "🌱 Seeding spices..."

# Seed your database here
# Create some example users
user1 = User.create(username: "rirochacha@gmail.com", email: "rirochacha@gmail.com", password: "password")
user2 = User.create(username: "allan@gmail.com", email: "allanriro@gmail.com", password: "password")

# Create some example blog posts associated with the users
user1.blog_posts.create(title: "First Post", content: "Hello, this is my first post!")
user1.blog_posts.create(title: "Second Post", content: "Another day, another post!")
user2.blog_posts.create(title: "Greetings", content: "Hello from Allan!")


puts "✅ Done seeding!"
