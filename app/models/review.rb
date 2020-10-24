class Review < ApplicationRecord
 belongs_to :user
 belongs_to :video


 validates :rating, presence: true, numericality: {
   less_than_or_equal_to: 5,
   greater_than_or_equal_to: 0.5
  }
end
