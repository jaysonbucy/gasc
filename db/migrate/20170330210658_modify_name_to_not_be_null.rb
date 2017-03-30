class ModifyNameToNotBeNull < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :firstname, :string, null: false
    change_column :users, :firstname, :string, null: false
  end
end
