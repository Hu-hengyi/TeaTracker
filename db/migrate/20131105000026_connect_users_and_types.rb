class ConnectUsersAndTypes < ActiveRecord::Migration
  def up
    add_column :users, :user_type_id, :integer
  end

  def down
    remove_column :users, :user_type_id
  end
end
