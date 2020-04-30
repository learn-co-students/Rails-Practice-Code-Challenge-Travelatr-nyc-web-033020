class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30  }

    def array_of_likes
        self.posts.map do |post|
            post.likes
        end
    end

    def total_likes
        self.array_of_likes.sum
    end

    def most_likes
        self.posts.sort_by {|post| post.likes}.last
    end

   

end
