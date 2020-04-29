class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts
validates :name, uniqueness: true
validates :age, numericality: {greater_than: 0}
validates :bio, length: {minimum: 30}

    def sum_of_likes
        answer = 0
        self.posts.each do |post|
            answer += post.likes
        end
        answer
    end

    def most_like
        answer = self.posts.first
        self.posts.each do |post|
            if post.likes > answer.likes
                answer = post
            end
        end
        answer
    end
end
