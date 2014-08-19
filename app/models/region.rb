class Region < ActiveRecord::Base
  has_many :animals, :through => :sightings
  has_many :sightings
  validates :name, :presence => true
end
