class CreateMustelids < ActiveRecord::Migration
  def self.up
    create_table :mustelids do |t|
      t.integer :species_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mustelids
  end
end
