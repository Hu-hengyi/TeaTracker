class CreateCps < ActiveRecord::Migration
  def change
    create_table :cps do |t|
      t.string :name

      t.timestamps
    end
  end
end
