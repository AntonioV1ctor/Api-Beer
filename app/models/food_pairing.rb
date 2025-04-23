# frozen_string_literal: true

class FoodPairing < ApplicationRecord
  has_and_belongs_to_many :beers

  validates :name, presence: true, uniqueness: true
end
