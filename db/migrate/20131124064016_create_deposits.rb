class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.float :weight
      t.string :quality
      t.references :farm, :cp

      t.timestamps
    end
  end
end
