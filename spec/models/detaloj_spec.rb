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
