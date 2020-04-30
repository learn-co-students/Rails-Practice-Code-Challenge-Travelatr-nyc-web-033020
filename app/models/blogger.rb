class Blogger < ApplicationRecord

  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: { minimum: 30 }

  def total_likes
    self.posts.sum { |p| p.likes }
  end

  def post_with_most_likes
    self.posts.max_by { |p| p.likes }
  end

  def top_destinations_by_posts(n)
    self.destinations.max_by(n) { |d| d.posts.count }
  end

end
