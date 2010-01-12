class Location < ActiveRecord::Base
  has_many :location_mustelids
  has_many :mustelids, :through => :location_mustelids
  has_many :keeper_locations
  has_many :keepers, :through => :keeper_locations
  validates_presence_of :country, :address
end
