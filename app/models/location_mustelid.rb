# == Schema Information
# Schema version: 20100119014302
#
# Table name: location_mustelids
#
#  id          :integer(4)      not null, primary key
#  mustelid_id :integer(4)
#  location_id :integer(4)
#  start_date  :datetime
#  end_date    :datetime
#

class LocationMustelid < ActiveRecord::Base
  belongs_to :mustelid
  belongs_to :location
end
