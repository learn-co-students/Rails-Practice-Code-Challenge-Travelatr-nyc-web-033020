class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { maximum: 30 }

  def total_likes
    likes = self.posts.map { |post| post.likes }
    likes.reduce { |acc, cur| acc + cur }
  end

  def most_liked_post
    posts = self.posts
    posts.max_by { |post| post.likes }
  end
end
