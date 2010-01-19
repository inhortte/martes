# == Schema Information
# Schema version: 20100119014302
#
# Table name: keepers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Keeper < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :mustelids
  has_many :keeper_locations
  has_many :locations, :through => :keeper_locations
  validates_presence_of :name

  def locations
    self.keeper_locations(true).select { |kl|
      kl.end_date.nil?
    }.inject([]) { |locs, kl|
      locs << kl.location
    }
  end

  def add_location(loc)
    kl = KeeperLocation.create(:keeper_id => self.id, :location_id => loc.id)
  end

  def remove_location(loc)
    KeeperLocation.find_by_keeper_id_and_location_id(self.id, loc.id).destroy
  end
end
