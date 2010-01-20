# -*- coding: utf-8 -*-
Country.create!(:abbr => "CA", :name => "CANADA", :printable_name => "Canada")

location1_attributes = { :name => "terra nova",
                         :country_id => 1,
                         :province => "newfoundland",
                         :address => "terra nova" }
location2_attributes = { :name => "hope for wildlife",
                         :country_id => 1,
                         :province => "nova scotia",
                         :address => "halifax" }
mustelid_attributes = { :name => "twiggie",
                        :species_id => 1 }

# General location stuff

Given /^a location$/ do
  @location = Location.new location1_attributes
end

When /^I browse to locations$/ do
  visit locations_path
end

When /^I click "([^\"]*)" for the location "([^\"]*)"$/ do |link, name|
  within("#entry" + Location.find_by_name(name).id.to_s) do
    click_link link
  end
end

Then /^I should see the keepers for the location "([^\"]*)"$/ do |name|
  Location.find_by_name(name).keepers.each { |k|
    response.should contain(k.name)
  }
end

# Scenario: Show all locations

Given /^a number of locations$/ do
  @location1 = Location.create! location1_attributes
  @location2 = Location.create! location2_attributes
end

Then /^I should see a list of the locations$/ do
  response.should contain("terra nova")
  response.should contain("hope for wildlife")
end

# Scenario: Add a new location

Given /^a new location form$/ do
  visit locations_path
  click_link "Add a Location"
end

When /^I fill out the form with a new location and submit it$/ do
  fill_in "Name", :with => "the lair of habosh"
  fill_in "Address", :with => "u uranie"
  fill_in "Province", :with => "holešovice"
  select "Canada", :from => "Country"
  click_button "Save"
end

Then /^the new location should be in the list of locations$/ do
  visit locations_path
  response.should contain("the lair of habosh")
end

# Scenario: Delete a location

When /^I see "([^\"]*)" in the list of locations$/ do |name|
  response.should contain(name)
end

When /^I delete "([^\"]*)"$/ do |name|
  click_link "delete"
end

Then /^"([^\"]*)" should no longer be in the list$/ do |name|
  response.should_not contain(name)
end

# Scenario: Edit a location

When /^I edit "([^\"]*)"$/ do |name|
  click_link "edit"
end

When /^I change its province to "([^\"]*)" and its address to "([^\"]*)"$/ do |province, address|
  fill_in "Province", :with => "newfoundland"
  fill_in "Address", :with => "corner brook"
  click_button "Update"
end

Then /^"([^\"]*)" "([^\"]*)" and "([^\"]*)" should be in the list$/ do |name, province, address|
  response.should contain(name)
  response.should contain(province)
  response.should contain(address)
end
