class Blogger < ApplicationRecord
   has_many :posts 

   validates :name, uniqueness: true
   validates :age, numericality: { minimum: 1 }
   validates :bio, length: { minimum: 30 }
   
   def total_num_likes 
      Post.all.select do |post|
         post.blogger_id == self.id 
      end.map{ |post| post.likes }.count 
   end 

   def my_posts 
      Post.all.select do |post|
         post.blogger_id == self.id 
      end
   end 

   def most_liked_post 
      self.my_posts.select do |post|
         post.likes 
      end.max 
   end 

end
