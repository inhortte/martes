class KeeperMustelid < ActiveRecord::Migration
  def self.up
    create_table :keepers_mustelids, :id => false do |t|
      t.references :keeper
      t.references :mustelid
    end
  end

  def self.down
    drop_table :keepers_mustelids
  end
end
