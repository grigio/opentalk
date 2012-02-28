# -*- encoding : utf-8 -*-
class AddAdminUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, :default => 'authenticated'
  end

  def self.down
    remove_column :users, :role
  end
end
