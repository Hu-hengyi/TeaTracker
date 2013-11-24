class AddFarmIdToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :farm_id, :integer
  end
end
