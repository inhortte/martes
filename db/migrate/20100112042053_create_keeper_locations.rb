class CreateKeeperLocations < ActiveRecord::Migration
  def self.up
    create_table :keeper_locations do |t|
      t.references :keeper
      t.references :location
      t.datetime :start_date
      t.datetime :end_date
    end
  end

  def self.down
    drop_table :keeper_locations
  end
end
