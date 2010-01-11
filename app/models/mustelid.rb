class Mustelid < ActiveRecord::Base
  default_find_option :order, :name

  belongs_to :species
  validates_presence_of :species_id, :name
end
