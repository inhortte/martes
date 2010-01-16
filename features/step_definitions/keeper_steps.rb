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
  @keeper.mustelids[0].name.should == "twiggie"
end

When /^the keeper stops tending the mustelid$/ do
  @keeper.mustelids.delete(@mustelid1)
end

Then /^the keeper will no longer be associated with the mustelid$/ do
  @keeper.mustelids.includes?(@mustelid1).should be_false
end

Then /^the keeper should be associated to no locations$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^the keeper is associated to no locations$/ do
  pending # express the regexp above with the code you wish you had
end

When /^a keeper is associated with a location$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the keeper should be shown at that location$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the keepers start_date should be set for that location$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^the keeper is associated with one location$/ do
  pending # express the regexp above with the code you wish you had
end

When /^a keeper is associated with another location$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the keeper should be shown at both locations$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the keepers start_date should be set for the new location$/ do
  pending # express the regexp above with the code you wish you had
end

When /^a keeper is disassociated with the location$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the keepers end_date should be set for the location$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the keeper should not be shown at the location$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the keeper is associated with at least one location$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the end_date of at least one location is not set$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^each valid location should be listed$/ do
  pending # express the regexp above with the code you wish you had
end
