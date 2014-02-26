class AddPayGroupIdToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :payGroup_id, :integer
  end
end
