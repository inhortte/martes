class CreateLocationMustelids < ActiveRecord::Migration
  def self.up
    create_table :location_mustelids do |t|
      t.references :mustelid
      t.references :location
      t.datetime :start_date
      t.datetime :end_date
    end
  end

  def self.down
    drop_table :location_mustelids
  end
end
