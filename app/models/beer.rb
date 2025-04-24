# frozen_string_literal: true

class Beer < ApplicationRecord
  has_many :food_pairings, dependent: :destroy
  has_many :pubs, dependent: :destroy

  validates :name, presence: true
end
