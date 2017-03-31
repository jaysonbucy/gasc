class UpdateLastnameNoNull < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :lastname, :string, null: false
  end
end
