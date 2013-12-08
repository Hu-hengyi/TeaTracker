class DropPayments < ActiveRecord::Migration
  def up
    drop_table :payments
  end

  def down
    create_table "payments", :force => true do |t|
      t.float    "amount"
      t.string   "check_number"
      t.boolean  "paid"
      t.datetime "created_at",   :null => false
      t.datetime "updated_at",   :null => false
    end
  end
end
