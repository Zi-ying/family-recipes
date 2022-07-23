class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :food_type, presence: true
  validates :ingredient, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_recipe_characteristic,
  against: [
    :name,
    :food_type,
    :ingredient,
    :baking_temperature,
    :preparation_time,
    :cooking_time
    ],
  using: {
    tsearch: { prefix: true }
    }
end
