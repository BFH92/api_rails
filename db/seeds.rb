# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.times do 
  user = User.create!( 
    email: "a@a.com",
    password:'azerty'
  )
end
1.times do 
  user = User.create!( 
    email: "b@b.com",
    password:'azerty'
  )
end 
29.times do 
  article = Article.create!( 
    title: Faker::TvShows::BreakingBad.episode,
    content:Faker::Lorem.paragraph,
    user_id: 1,
    is_private: false
  )
end
1.times do 
  article = Article.create!( 
    title: Faker::TvShows::BreakingBad.episode,
    content:Faker::Lorem.paragraph,
    user_id: 1,
    is_private: true
  )
end

10.times do
  comment = Comment.create!(
    content: Faker::Lorem.paragraph, 
    user_id: [*1..2].sample,
    article_id: [*1..3].sample,
  )
end