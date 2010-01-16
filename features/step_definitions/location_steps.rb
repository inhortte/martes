location_attributes = { :name => "new location",
                        :country => "ca", 
                        :province => "nova scotia",
                        :address => "halifax" }
mustelid_attributes = { :name => "twiggie",
                        :species_id => 1 }
keeper_attributes = { :name => "roger" }

Given /^a location$/ do
  @location = Location.new location_attributes
end

When /^the location is new$/ do
  @location.new_record?.should be_true
  @location.save
end

Then /^the location should contain no mustelids$/ do
  @location.mustelids.should == []
end

When /^a mustelid is associated with the location$/ do
  @mustelid = Mustelid.create mustelid_attributes
  @location.mustelids << @mustelid
end

Then /^the location should contain the mustelid$/ do
  @location.mustelids.size.should == 1
  @location.mustelids[0].name.should == "twiggie"
end

Then /^the location should contain no keepers$/ do
  @location.keepers.should == []
end

When /^a keeper is associated with the location$/ do
  @keeper = Keeper.create keeper_attributes
  @location.keepers << @keeper
end

Then /^the location should contain the keeper$/ do
  @location.keepers.size.should == 1
  @location.keepers[0].name.should == "roger"
end
