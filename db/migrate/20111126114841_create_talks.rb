# -*- encoding : utf-8 -*-
class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string 	:title
      t.text 	:content
      t.string	:status
      t.references :user

      t.timestamps
    end
  end
end
