class CreateKeepers < ActiveRecord::Migration
  def self.up
    create_table :keepers do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :keepers
  end
end
