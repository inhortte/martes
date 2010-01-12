class Keeper < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :mustelids
  has_many :keeper_locations
  has_many :locations, :through => :keeper_locations
  validates_presence_of :name
end
