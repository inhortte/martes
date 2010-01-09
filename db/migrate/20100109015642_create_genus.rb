class CreateGenus < ActiveRecord::Migration
  def self.up
    create_table :genus do |t|
      t.integer :subfamily_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :genus
  end
end
