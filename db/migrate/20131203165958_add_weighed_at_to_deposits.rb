class AddWeighedAtToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :weighed_at, :datetime
  end
end
