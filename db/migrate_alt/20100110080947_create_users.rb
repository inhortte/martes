class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :email
      t.string :first_name
      t.string :middle_names
      t.string :last_name
      t.string :salt
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
