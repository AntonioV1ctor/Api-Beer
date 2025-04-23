# frozen_string_literal: true

# spec/models/beer_spec.rb

require 'rails_helper'

RSpec.describe Beer do
  it 'is valid with valid attributes' do
    beer = described_class.new(name: 'IPA', description: 'A hoppy beer')
    expect(beer).to be_valid
  end

  it 'is not valid without a name' do
    beer = described_class.new(description: 'A hoppy beer')
    expect(beer).not_to be_valid
  end
end
