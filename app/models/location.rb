# == Schema Information
# Schema version: 20100119014302
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  country_id :integer(4)
#  province   :string(255)
#  address    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Location < ActiveRecord::Base
  has_many :location_mustelids, :dependent => :nullify
  has_many :mustelids, :through => :location_mustelids
  has_many :keeper_locations
  has_many :keepers, :through => :keeper_locations
  belongs_to :country
  validates_presence_of :name, :country_id, :address

  def keepers
    self.keeper_locations(true).select { |kl|
      kl.end_date.nil?
    }.inject([]) { |keeps, kl|
      keeps << kl.keeper
    }
  end

  def add_keeper(keep)
    kl = KeeperLocation.create(:keeper_id => keep.id, :location_id => self.id)
  end

  def remove_keeper(keep)
    KeeperLocation.find_by_keeper_id_and_location_id(keep.id, self.id).destroy
  end

  # Modify the destroy method to kill the KeeperLocation and LocationMustelid
  # entries.
end
