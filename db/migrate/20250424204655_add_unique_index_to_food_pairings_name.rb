# frozen_string_literal: true

class AddUniqueIndexToFoodPairingsName < ActiveRecord::Migration[7.1]
  def change
    add_index :food_pairings, :name, unique: true
  end
end
