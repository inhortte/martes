# == Schema Information
# Schema version: 20100119014302
#
# Table name: countries
#
#  id             :integer(4)      not null, primary key
#  abbr           :string(255)
#  name           :string(255)
#  printable_name :string(255)
#  iso3           :string(255)
#  numcode        :integer(4)
#

class Country < ActiveRecord::Base
  has_many :locations
end
