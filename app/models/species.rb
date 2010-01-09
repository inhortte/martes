class Species < ActiveRecord::Base
  belongs_to :genus
  has_many :mustelids
end
