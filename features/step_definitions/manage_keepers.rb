keeper1_attributes = { :name => "roger" }
keeper2_attributes = { :name => "tony" }

Given /^a number of keepers$/ do
  @keeper1 = Keeper.create! keeper1_attributes
  @keeper2 = Keeper.create! keeper2_attributes
end

# Scenario: Add a new keeper

Given /^that I want to enter a new keeper$/ do
  # Always passes.
end

When /^I browse to keepers$/ do
  visit keepers_path
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
