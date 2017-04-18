class CreateSwimEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_events do |t|
      t.string :name, null: false
      t.integer :distance_in_meters, null: false
      t.integer :age_group_start, null: false
      t.integer :age_group_end, null: false
      t.integer :gender, null: false

      t.timestamps
    end
  end
end
