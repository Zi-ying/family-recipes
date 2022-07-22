class Review < ApplicationRecord
  belongs_to :recipe

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greather_than: 0, less_than: 6 }
end
