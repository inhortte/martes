# == Schema Information
# Schema version: 20100119014302
#
# Table name: genus
#
#  id           :integer(4)      not null, primary key
#  subfamily_id :integer(4)
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Genus < ActiveRecord::Base
  belongs_to :subfamily
  has_many :species
end
