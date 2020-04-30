class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true
  validates :content, length: { minimum: 100 }

  def add_like 
    if self.likes
      self.likes += 1
    else 
      self.likes = 1
    end
  end
end
