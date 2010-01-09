class CreateSpecies < ActiveRecord::Migration
  def self.up
    create_table :species do |t|
      t.integer :genus_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :species
  end
end
