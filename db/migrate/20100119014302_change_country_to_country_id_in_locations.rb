class ChangeCountryToCountryIdInLocations < ActiveRecord::Migration
  def self.up
    rename_column :locations, :country, :country_id
    change_column :locations, :country_id, :integer
  end

  def self.down
    change_column :locations, :country_id, :string
    rename_column :locations, :country_id, :country
  end
end
