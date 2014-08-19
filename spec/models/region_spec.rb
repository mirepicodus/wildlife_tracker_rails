require 'spec_helper'

describe Region do
  it {should have_many :sightings}
  it {should have_many :animals}
  it {should validate_presence_of :name}
end
