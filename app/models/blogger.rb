class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def total_likes
        total = 0
        self.posts.each {|p| total += p.likes}
        total
    end

    def featured_post
        self.posts.max{|a,b| a.likes <=> b.likes}
    end
end
