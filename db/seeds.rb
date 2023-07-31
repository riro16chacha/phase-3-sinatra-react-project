#db/seeds.rb
puts "🌱 Seeding spices..."

# Seed your database here
Article.create(
    title: 'The Horn Of Africa',
    content: 'This is the content of the first article.', 
  )
  
  Article.create(
    title: 'Black is bold',
    content: 'This is the content of the second article.',
  )

puts "✅ Done seeding!"
