class CreateSubfamilies < ActiveRecord::Migration
  def self.up
    create_table :subfamilies do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :subfamilies
  end
end
