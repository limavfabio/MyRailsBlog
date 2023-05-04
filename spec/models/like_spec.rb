require 'rails_helper'

describe Like, type: :model do
  it '#update_posts_likes_counter' do
    author = User.create!(
      name: Faker::Name.name,
      photo: Faker::Avatar.image,
      bio: Faker::Lorem.sentence
    )

    post = Post.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      text: Faker::Lorem.paragraph,
      author:
    )

    Like.create!(
      author_id: author.id,
      post_id: post.id
    )

    post.update(likes_counter: post.likes.count)

    expect(post.likes_counter).to eq(1)
  end
end
