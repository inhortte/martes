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

require 'spec_helper'

describe Location do
  before(:each) do
    @valid_attributes = {
      :country => "value for country",
      :province => "value for province",
      :address => "value for address"
    }
  end

  it "should create a new instance given valid attributes" do
    Location.create!(@valid_attributes)
  end
end
