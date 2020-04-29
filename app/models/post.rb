class Post < ApplicationRecord
    belongs_to :blogger 
    belongs_to :destination 


    def like
        self.likes += 1 
    end

end
