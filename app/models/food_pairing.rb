# frozen_string_literal: true

class FoodPairing < ApplicationRecord
  has_many :beer_food_pairings, dependent: :destroy
  has_many :beers, through: :beer_food_pairings

  validates :name, presence: true, uniqueness: true
end
