class Destination < ApplicationRecord
  has_many :posts 

  def my_posts 
    Post.all.select do |post|
        post.destination_id == self.id
    end
  end 

  def top_five 
    self.my_posts.sort_by{ | datetime| direction="DESC" }[0..4]
  end

  def count_posts
    self.my_posts.count 
  end 

  def age 
    self.my_posts.map do |post|
        post.blogger.age 
    end.sum 
  end 

  def av_age
    self.age / self.count_posts
  end 
end
