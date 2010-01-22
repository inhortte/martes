# General mustelid stuff

Subfamily.create!(:name => 'mustelinae')
Genus.create!(:name => 'martes', :subfamily_id => 1)
Species.create!(:name => 'americana', :genus_id => 1)

Given /^a mustelid named "([^\"]*)"$/ do |name|
  Mustelid.create!(:name => name, :species_id => 1)
end

Given /^the location of the mustelid "([^\"]*)" is "([^\"]*)"$/ do |mname, lname|
  Mustelid.find_by_name(mname).add_location(Location.find_by_name(lname))
end

When /^I browse to mustelids$/ do
  visit mustelids_path
end

When /^I click "([^\"]*)" for the mustelid "([^\"]*)"$/ do |link, name|
  within("#entry" + Mustelid.find_by_name(name).id.to_s) do
    click_link link
  end
end

Then /^I should see the location for the mustelid "([^\"]*)"$/ do |name|
  l = Mustelid.find_by_name(name).location
  l_id = l.nil? ? 0 : l.id.to_s
  field_with_id("location").value.should == l_id
end

Then /^I should see the mustelids for the location "([^\"]*)"$/ do |name|
  Location.find_by_name(name).mustelids.each { |m|
    response.should contain(m.name)
  }
end

When /^I click remove for the mustelid "([^\"]*)"$/ do |name|
  within("#remove" + Mustelid.find_by_name(name).id.to_s) do
    click_link "remove"
  end
end


