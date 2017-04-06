class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.string :description, null: false
      t.string :url, null: false
      t.boolean :active, null: false, default: false
      t.string :created_by, null: false

      t.timestamps
    end
  end
end
