class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        self.posts.sort_by do |post|
            post.created_at
        end.last(5).reverse
    end

    def featured_post 
        self.posts.sort_by  {|post| post.likes}.last
    end
end
