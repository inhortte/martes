class LocationMustelid < ActiveRecord::Base
  belongs_to :mustelid
  belongs_to :location
end
