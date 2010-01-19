# == Schema Information
# Schema version: 20100119014302
#
# Table name: species
#
#  id         :integer(4)      not null, primary key
#  genus_id   :integer(4)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Species < ActiveRecord::Base
  belongs_to :genus
  has_many :mustelids
end
