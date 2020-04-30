class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true 
    validates :age, numericality: { greater_than: 0 } 
    validates :bio, length: { minimum: 30 } 

    def my_posts 
        Post.all.select do |post| 
            post.blogger_id == self.id 
        end 
    end 

    def total_likes 
       my_posts.map do |post| 
            post.likes
       end.count  
    end 

    def most_liked_post 
        self.my_posts.select do |post| 
            post.likes 
        end.max
    end 
end
