class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :display_name, :null => false
      t.string :email, :null => false
      t.string :crypted_password
      t.string :salt

      t.string :location
      t.string :website
      
      t.timestamps
    end    
    
    add_index :users, :email
    add_index :users, :display_name
  end

  def self.down
    drop_table :users
  end
end
