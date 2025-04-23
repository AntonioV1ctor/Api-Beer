# frozen_string_literal: true

# spec/models/food_pairing_spec.rb
require 'rails_helper'

RSpec.describe FoodPairing do
  it 'is valid with valid attributes' do
    food_pairing = described_class.new(name: 'Cheese')
    expect(food_pairing).to be_valid
  end

  it 'is not valid without a name' do
    food_pairing = described_class.new(name: nil)
    expect(food_pairing).not_to be_valid
  end

  it 'is not valid with a duplicate name' do
    described_class.create(name: 'Cheese')
    food_pairing = described_class.new(name: 'Cheese')
    expect(food_pairing).not_to be_valid
  end
end
