# frozen_string_literal: true

# spec/models/pub_spec.rb
require 'rails_helper'

RSpec.describe Pub do
  it 'is valid with valid attributes' do
    beer = Beer.create(name: 'IPA', description: 'A hoppy beer') # Crie um Beer válido
    pub = described_class.new(name: 'The Local Pub', location: 'Downtown', beer: beer)
    expect(pub).to be_valid
  end

  it 'is not valid without a name' do
    pub = described_class.new(name: nil, location: 'Downtown')
    expect(pub).not_to be_valid
  end

  it 'is not valid without a location' do
    pub = described_class.new(name: 'The Local Pub', location: nil)
    expect(pub).not_to be_valid
  end

  it 'is not valid with a duplicate name' do
    described_class.create(name: 'The Local Pub', location: 'Downtown')
    pub = described_class.new(name: 'The Local Pub', location: 'Uptown')
    expect(pub).not_to be_valid
  end
end
