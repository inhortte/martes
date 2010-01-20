keeper1_attributes = { :name => "roger" }
keeper2_attributes = { :name => "tony" }

# General stuff ... should be put in a seperate file

When /^I choose "([^\"]*)" from "([^\"]*)"$/ do |expr, tag|
  select /#{expr}/, :from => tag
end

# General keeper stuff

Given /^a number of keepers$/ do
  @keeper1 = Keeper.create! keeper1_attributes
  @keeper2 = Keeper.create! keeper2_attributes
end

When /^I browse to keepers$/ do
  visit keepers_path
end

When /^I click "([^\"]*)" for the keeper "([^\"]*)"$/ do |link, name|
  within("#entry" + Keeper.find_by_name(name).id.to_s) do
    click_link link
  end
end

Given /^a keeper named "([^\"]*)"$/ do |name|
  Keeper.create!(:name => name)
end

Given /^the location of "([^\"]*)" is "([^\"]*)"$/ do |kname, lname|
  Keeper.find_by_name(kname).add_location(Location.find_by_name(lname))
end

Then /^I should see the locations for the keeper "([^\"]*)"$/ do |name|
  Keeper.find_by_name(name).locations.each { |l|
    response.should contain(l.name)
  }
end

# Scenario: Add a new keeper

Given /^that I want to enter a new keeper$/ do
  # Always passes.
end

When /^I fill out the form with "([^\"]*)" as a new keeper and submit it$/ do |name|
  fill_in "Name", :with => name
  click_button
end

# Scenario: Delete a location

When /^I see "([^\"]*)" in the list of keepers$/ do |name|
  response.should contain(name)
end

# Scenario: Edit a location

When /^I change its name to "([^\"]*)"$/ do |name|
  fill_in "Name", :with => name
end

# Scenario: Remove a location of a keeper

When /^I click remove for the location "([^\"]*)"$/ do |name|
  within("#remove" + Location.find_by_name(name).id.to_s) do
    click_link "remove"
  end
end

