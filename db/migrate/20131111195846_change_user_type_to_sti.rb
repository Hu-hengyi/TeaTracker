class ChangeUserTypeToSti < ActiveRecord::Migration
  def up
    drop_table :user_types
    add_column :users, :type, :string
    remove_column :users, :user_type_id
  end

  def down
    create_table :user_types do |t|
      t.string :name
      t.timestamps
    end
    remove_column :users, :type
    add_column :users, :user_type_id, :integer
  end
end
