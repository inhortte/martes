# == Schema Information
# Schema version: 20100114004035
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  country    :string(255)
#  province   :string(255)
#  address    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Location < ActiveRecord::Base
  has_many :location_mustelids
  has_many :mustelids, :through => :location_mustelids
  has_many :keeper_locations
  has_many :keepers, :through => :keeper_locations
  validates_presence_of :name, :country, :address
end
