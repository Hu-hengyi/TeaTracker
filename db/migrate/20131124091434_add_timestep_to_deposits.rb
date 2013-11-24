class AddTimestepToDeposits < ActiveRecord::Migration
  def change_table
    add_column(:deposits, :created_at, :datetime)
    add_column(:deposits, :updated_at, :datetime)
  end
end
