# == Schema Information
# Schema version: 20100119014302
#
# Table name: detalojs
#
#  id                   :integer(4)      not null, primary key
#  mustelid_id          :integer(4)
#  image                :binary
#  condylobassal_length :float
#  color                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Detaloj < ActiveRecord::Base
  belongs_to :mustelid
end
