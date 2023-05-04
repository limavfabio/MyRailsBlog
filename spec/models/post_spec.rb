require 'rails_helper'

describe Post, type: :model do
  it 'is valid with all correct arguments' do
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
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    author = User.create!(
      name: Faker::Name.name,
      photo: Faker::Avatar.image,
      bio: Faker::Lorem.sentence
    )

    post = Post.new(
      title: nil,
      text: Faker::Lorem.paragraph,
      author:
    )
    expect(post).to_not be_valid
  end

  it '#recent_comments' do
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

    10.times do
      Comment.create!(
        text: Faker::Lorem.sentence,
        author:,
        post:
      )
    end
    last_5_comments = post.recent_comments
    expect(last_5_comments.size).to eq(5)
  end
end
