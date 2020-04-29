class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

    def average_age
        total_age = 0
        count = 0
        self.bloggers.each do |blogger|
            total_age += blogger.age
            count += 1
        end
        if count == 0 
            return "nobody has written about this destination yet."
        else
            answer = total_age / count *1.0
        end
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
