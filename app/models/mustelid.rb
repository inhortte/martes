class Mustelid < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :species_id, :name
end
