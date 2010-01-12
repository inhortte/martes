require 'spec_helper'

describe KeeperLocation do
  before(:each) do
    @valid_attributes = {
      :keeper_id => 1,
      :location_id => 1,
      :start_date => Time.now,
      :end_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    KeeperLocation.create!(@valid_attributes)
  end
end
