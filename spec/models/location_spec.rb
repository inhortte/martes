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
