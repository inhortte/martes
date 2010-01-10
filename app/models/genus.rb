class Genus < ActiveRecord::Base
  belongs_to :subfamily
  has_many :species
end
