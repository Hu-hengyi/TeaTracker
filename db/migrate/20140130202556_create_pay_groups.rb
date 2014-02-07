class CreatePayGroups < ActiveRecord::Migration
  def up
    create_table 'pay_groups' do |t|
      t.string :name
      t.text :notes
      t.timestamps
    end
  end

  def down
    drop_table 'pay_groups'
  end
end
