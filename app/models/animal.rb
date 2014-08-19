class Animal < ActiveRecord::Base
  has_many :regions, :through => :sightings
  has_many :sightings
  validates :name, :presence => true
end
