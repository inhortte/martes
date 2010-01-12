class KeeperLocation < ActiveRecord::Base
  belongs_to :keeper
  belongs_to :location
end
