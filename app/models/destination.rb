class Destination < ApplicationRecord

  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts(n)
    self.posts.max_by(n) { |p| p.updated_at }
  end

  def most_popular_post
    self.posts.max_by { |p| p.likes }
  end

  def average_age_of_bloggers
    self.bloggers.sum { |b| b.age } / self.bloggers.count
  end

end
