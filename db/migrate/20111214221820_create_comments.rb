# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.references :commentable, :polymorphic => true
      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type], :name => "index_on_commentable"
    add_index :comments, [:commentable_id, :commentable_type, :user_id], :name => "index_on_commentable_and_user"
  end
end
