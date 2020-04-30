class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def latest_posts
        posts = self.posts
        sorted = posts.sort_by(&:created_at)
        top_5 = sorted[0..4]
        # while top_5.length < 5 do
        #     max = posts.max {|a,b| a.timestamp <=> b.timestamp}
        #     posts.delete_at(max.id)
        # end
        # top_5
    end

    def featured_post
        self.posts.max{|a,b| a.likes <=> b.likes}
    end

    def average_blogger_age
        sum = 0
        self.bloggers.each {|blogger| sum += blogger.age}
        sum/self.bloggers.length
    end
end

