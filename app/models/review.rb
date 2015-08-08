class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  
  validates :rating, :comment, presence: true
end
