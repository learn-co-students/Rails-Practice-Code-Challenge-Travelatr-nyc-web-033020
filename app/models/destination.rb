class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts
  
  def five_most_recent
    most_recent = []
    index = -5
    while index < 0
      if self.posts[index]
        most_recent << self.posts[index]
      end
      index += 1
    end
    most_recent
  end

  def most_liked_post
    self.posts.max_by { |post| post.likes }
  end

  def average_age
    bloggers_age = self.bloggers.map { |blogger| blogger.age }
    bloggers_age.reduce { |acc, cur| acc + cur } / bloggers.count
  end
end
  
