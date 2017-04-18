class CreateSwimTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_times do |t|
      t.references :event_heats, foreign_key: true, null: false
      t.references :swimmer_details, foreign_key: true, null: false
      t.decimal :time_in_seconds, null: false

      t.timestamps
    end
  end
end
