class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string 	:title
      t.text 	:content
      t.integer	:position
      t.string	:status

      t.timestamps
    end
  end
end
