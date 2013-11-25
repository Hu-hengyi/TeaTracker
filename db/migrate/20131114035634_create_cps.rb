class CreateCps < ActiveRecord::Migration
  def change
    create_table :cps do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
