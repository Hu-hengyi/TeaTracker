class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.integer :bushes
      t.integer :workers
      t.float :longitude
      t.float :latitude
      t.text :notes

      t.timestamps
    end
  end
end
