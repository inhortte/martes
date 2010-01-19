# == Schema Information
# Schema version: 20100119014302
#
# Table name: mustelids
#
#  id         :integer(4)      not null, primary key
#  species_id :integer(4)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Mustelid < ActiveRecord::Base
  default_find_option :order, :name

  belongs_to :species
  has_one :detaloj, :dependent => :destroy
  has_and_belongs_to_many :keepers
  has_many :location_mustelids
  has_many :locations, :through => :location_mustelids
  validates_presence_of :species_id, :name
  default_find_option :order, :name

  accepts_nested_attributes_for :detaloj, :allow_destroy => true,
    :reject_if => proc { |attr| attr.all? { |k, v| v.blank? } }
end
