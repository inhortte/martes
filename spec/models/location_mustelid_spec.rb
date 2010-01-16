# == Schema Information
# Schema version: 20100114004035
#
# Table name: location_mustelids
#
#  id          :integer(4)      not null, primary key
#  mustelid_id :integer(4)
#  location_id :integer(4)
#  start_date  :datetime
#  end_date    :datetime
#

require 'spec_helper'

describe LocationMustelid do
  before(:each) do
    @valid_attributes = {
      :mustelid_id => 1,
      :location_id => 1,
      :start_date => Time.now,
      :end_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    LocationMustelid.create!(@valid_attributes)
  end
end
