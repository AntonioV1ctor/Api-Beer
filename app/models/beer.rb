# frozen_string_literal: true

class Beer < ApplicationRecord
  has_many :food_pairings
  has_many :pubs

  validates :name, presence: true
end
