class CreateDetalojs < ActiveRecord::Migration
  def self.up
    create_table :detalojs do |t|
      t.references :mustelid
      t.binary :image
      t.float :condylobassal_length
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :detalojs
  end
end
