# == Schema Information
# Schema version: 20100114004035
#
# Table name: keeper_locations
#
#  id          :integer(4)      not null, primary key
#  keeper_id   :integer(4)
#  location_id :integer(4)
#  start_date  :datetime
#  end_date    :datetime
#

class KeeperLocation < ActiveRecord::Base
  belongs_to :keeper
  belongs_to :location
end
