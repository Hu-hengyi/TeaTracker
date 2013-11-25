class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :check_number
      t.boolean :paid

      t.timestamps
    end
  end
end
