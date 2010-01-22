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
  default_find_option :order, :name

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

  def mustelids
    self.location_mustelids(true).select { |lm|
      lm.end_date.nil?
    }.inject([]) { |weasels, lm|
      weasels << lm.mustelid
    }
  end

  # Right now, I am assuming that a mustelid will only be at one
  # location at any one time. Probably I'll have to change this
  # in the future and it'll be nerve-wracking and a general irritant.
  # But, I am funny that way.
  def add_mustelid(weasel)
    begin
      LocationMustelid.find_all_by_mustelid_id(weasel.id).each { |lm|
        lm.destroy
      }
    rescue NoMethodError
      # If there is no entry in location_mustelids, it will try
      # to call 'each' on nil.
    end
    LocationMustelid.create(:location_id => self.id, :mustelid_id => weasel.id)
  end

  def remove_mustelid(weasel)
    LocationMustelid.find_by_location_id_and_mustelid_id(self.id, weasel.id).destroy
  end

  def destroy
    KeeperLocation.find(:all,
                        :conditions => ["location_id = ?", self.id]).each { |kl|
      kl.orig_destroy
    }
    LocationMustelid.find(:all,
                          :conditions => ["location_id = ?", self.id]).each { |lm|
      lm.orig_destroy
    }
    super
  end
end
