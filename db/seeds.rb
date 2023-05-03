# Create 10 users with randomized data
10.times do
  User.create(
    name: Faker::Name.name,
    photo: Faker::Avatar.image,
    bio: Faker::Lorem.sentence
  )
end

# Create 50 posts with randomized data
50.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    text: Faker::Lorem.paragraph,
    author: User.order(Arel.sql('RANDOM()')).first
  )
end

# Create 100 comments with randomized data
100.times do
  Comment.create(
    text: Faker::Lorem.sentence,
    author: User.order(Arel.sql('RANDOM()')).first,
    post: Post.order(Arel.sql('RANDOM()')).first
  )
end

# Create 200 likes with randomized data
200.times do
  Like.create(
    author: User.order(Arel.sql('RANDOM()')).first,
    post: Post.order(Arel.sql('RANDOM()')).first
  )
end
