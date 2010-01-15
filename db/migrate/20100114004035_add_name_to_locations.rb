class AddNameToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :name, :string
  end

  def self.down
    drop_column :locations, :name
  end
end
