class Mustelid < ActiveRecord::Base
  default_find_option :order, :name

  belongs_to :species
  validates_presence_of :species_id, :name
  belongs_to :species
  has_one :detaloj
  default_find_option :order, :name

  accepts_nested_attributes_for :detaloj, :allow_destroy => true,
    :reject_if => proc { |attr| attr.all? { |k, v| v.blank? } }
end
