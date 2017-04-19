class CreateSwimmerDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :swimmer_details do |t|
      t.string :name, null: false
      t.date :date_of_birth, null: false
      t.integer :gender, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
