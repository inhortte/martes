# == Schema Information
# Schema version: 20100114004035
#
# Table name: subfamilies
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Subfamily < ActiveRecord::Base
  has_many :genus
end
