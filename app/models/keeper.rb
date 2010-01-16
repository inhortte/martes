# == Schema Information
# Schema version: 20100114004035
#
# Table name: keepers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Keeper < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :mustelids
  has_many :keeper_locations, :dependent => :nullify
  has_many :locations, :through => :keeper_locations
  validates_presence_of :name
end
