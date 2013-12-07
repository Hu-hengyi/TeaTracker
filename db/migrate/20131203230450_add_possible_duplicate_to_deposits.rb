class AddPossibleDuplicateToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :possible_duplicate, :boolean, default: false
  end
end
