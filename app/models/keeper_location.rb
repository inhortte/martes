# == Schema Information
# Schema version: 20100114004035
#
# Table name: keeper_locations
#
#  id          :integer(4)      not null, primary key
#  keeper_id   :integer(4)
#  location_id :integer(4)
#  start_date  :datetime
#  end_date    :datetime
#

class KeeperLocation < ActiveRecord::Base
  belongs_to :keeper
  belongs_to :location
  validate_on_create :cannot_duplicate_association

  def before_create
    self.start_date ||= Time.now
  end

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
    assoc = KeeperLocation.find_by_keeper_id_and_location_id(keeper_id, location_id)
    if(!assoc.nil? && assoc.end_date.nil?)
      errors.add_to_base("This keeper/location pair is currently active")
    end
  end
end
