# == Schema Information
# Schema version: 20100119014302
#
# Table name: detalojs
#
#  id                   :integer(4)      not null, primary key
#  mustelid_id          :integer(4)
#  image                :binary
#  condylobassal_length :float
#  color                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

require 'spec_helper'

describe Detaloj do
  before(:each) do
    @valid_attributes = {
      :mustelid_id => 1,
      :image => ,
      :condylobassal_length => 1.5,
      :color => "value for color"
    }
  end

  it "should create a new instance given valid attributes" do
    Detaloj.create!(@valid_attributes)
  end
end
