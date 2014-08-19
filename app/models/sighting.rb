class Sighting < ActiveRecord::Base
  belongs_to :region
  belongs_to :animal
  # default_scope { (order: 'date') }
end
