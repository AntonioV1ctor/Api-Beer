# frozen_string_literal: true

class CreateJoinTableBeerFoodPairings < ActiveRecord::Migration[8.0]
  def change
    create_join_table :beers, :food_pairings do |t|
      # t.index [:beer_id, :food_pairing_id]
      # t.index [:food_pairing_id, :beer_id]
    end
  end
end
