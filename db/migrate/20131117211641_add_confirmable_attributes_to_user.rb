class AddConfirmableAttributesToUser < ActiveRecord::Migration
  change_table :users do |t|
    t.column :confirmation_token, :string
    t.column :confirmed_at, :datetime
    t.column :confirmation_sent_at, :datetime
    t.column :unconfirmed_email, :string
    t.index :confirmation_token
  end
end
