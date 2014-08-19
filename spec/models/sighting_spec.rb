require 'spec_helper'

describe Sighting do
  it {should belong_to :animal}
  it {should belong_to :region}

  it "should have a region" do
    test_animal = Animal.create(name: 'dog')
    test_region = Region.create(name: "deathly hallows")
    test_sighting = Sighting.create(region_id: test_region.id, animal_id: test_animal.id)
    expect(test_animal.sightings.first.region.name).to eq test_region.name
  end
end
