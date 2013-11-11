class ChangeRealNameToName < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.rename :real_name, :name
    end
  end

  def down
    change_table :users do |t|
      t.rename :name, :real_name
    end
  end
end
