class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :food_type, presence: true
  validates :ingredient, presence: true
end
