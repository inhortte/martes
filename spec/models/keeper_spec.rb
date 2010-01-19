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

require 'spec_helper'

describe Keeper do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Keeper.create!(@valid_attributes)
  end
end
