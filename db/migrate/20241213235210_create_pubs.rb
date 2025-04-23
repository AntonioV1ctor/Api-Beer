# frozen_string_literal: true

class CreatePubs < ActiveRecord::Migration[8.0]
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
