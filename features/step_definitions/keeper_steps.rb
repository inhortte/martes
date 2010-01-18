location_attributes = { :name => "new location",
                        :country => "ca", 
                        :province => "nova scotia",
                        :address => "halifax" }
mustelid_attributes = { :name => "twiggie",
                        :species_id => 1 }
keeper_attributes = { :name => "roger" }

Given /^a keeper$/ do
    @keeper = Keeper.new keeper_attributes
end

When /^the keeper is new$/ do
    @keeper.save
end

Then /^the keeper should be tending no mustelids$/ do
    @keeper.mustelids.should == []
end

When /^a mustelid is associated to the keeper$/ do
  @mustelid1 = Mustelid.create mustelid_attributes
  @keeper.mustelids << @mustelid1
end

Then /^the keeper should tend the mustelid$/ do
  @keeper.mustelids[0].name.should == "twiggie"
end

Given /^the keeper tends a mustelid$/ do
  @mustelid1 = Mustelid.create mustelid_attributes
  @keeper.mustelids << @mustelid1
  @keeper.mustelids[0].name.should == "twiggie"
end

When /^the keeper stops tending the mustelid$/ do
  @keeper.mustelids.delete(@mustelid1)
end

Then /^the keeper will no longer be associated with the mustelid$/ do
  @keeper.mustelids.include?(@mustelid1).should be_false
end

Then /^the keeper should be associated to no locations$/ do
  @keeper.locations.should == []
end

Given /^the keeper is associated to no locations$/ do
  @keeper.locations.should == []
end

When /^a keeper is associated with a location$/ do
  @location1 = Location.create location_attributes
  @keeper.add_location(@location1)
end

Then /^the keeper should be shown at that location$/ do
  @keeper.locations.include?(@location1).should be_true
end

Then /^the keepers start_date should be set for that location$/ do
  KeeperLocation.find_by_keeper_id_and_location_id(@keeper.id, @location1.id).start_date.should_not be_nil
end

Given /^the keeper is associated with one location$/ do
  @location1 = Location.create location_attributes
  @location2 = Location.create(location_attributes.merge({:name => 'trury'}))
  @keeper.add_location(@location1)
end

When /^a keeper is associated with another location$/ do
  @keeper.add_location(@location2)
end

Then /^the keeper should be shown at both locations$/ do
  @keeper.locations.include?(@location1).should be_true
  @keeper.locations.include?(@location2).should be_true
end

Then /^the keepers start_date should be set for the new location$/ do
  KeeperLocation.find_by_keeper_id_and_location_id(@keeper.id, @location2.id).start_date.should_not be_nil
end

When /^a keeper is disassociated with the location$/ do
  @keeper.remove_location(@location1)
end

Then /^the keepers end_date should be set for the location$/ do
  @keeper.locations.include?(@location1).should be_false
  KeeperLocation.find_by_keeper_id_and_location_id(@keeper.id, @location1.id).end_date.should_not be_nil
end

Then /^the keeper should not be shown at the location$/ do
  @keeper.locations.include?(@location).should be_false
end

When /^the keeper is associated with at least one location$/ do
  @location1 = Location.create location_attributes
  @location2 = Location.create(location_attributes.merge({:name => 'trury'}))
  @keeper.add_location(@location1)
  @keeper.add_location(@location2)
end

When /^the end_date of at least one location is not set$/ do
  @keeper.remove_location(@location2)
end

Then /^each valid location should be listed$/ do
  # The only valid location should be @location1
  @keeper.locations[0].name.should == 'new location'
end
