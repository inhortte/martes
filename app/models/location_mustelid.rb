# == Schema Information
# Schema version: 20100119014302
#
# Table name: location_mustelids
#
#  id          :integer(4)      not null, primary key
#  mustelid_id :integer(4)
#  location_id :integer(4)
#  start_date  :datetime
#  end_date    :datetime
#

class LocationMustelid < ActiveRecord::Base
  belongs_to :mustelid
  belongs_to :location
  validate_on_create :cannot_duplicate_association

  def before_create
    self.start_date ||= Time.now
  end

  alias_method :orig_destroy, :destroy
  def destroy
    self.end_date ||= Time.now
    self.save
    return false
  end

  def delete
    return self.destroy
  end

  def cannot_duplicate_association
    logger.debug('entering cannot_duplicate_association')
    assoc = LocationMustelid.find_by_location_id_and_mustelid_id(location_id, mustelid_id)
    if(!assoc.nil? && assoc.end_date.nil?)
      errors.add_to_base("This location/mustelid pair is currently active")
    end
  end
end
