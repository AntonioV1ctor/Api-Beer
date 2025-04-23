# frozen_string_literal: true

class CreateFoodPairings < ActiveRecord::Migration[8.0]
  def change
    create_table :food_pairings do |t|
      t.string :name

      t.timestamps
    end
  end
end
