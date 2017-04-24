class CreateEventHeats < ActiveRecord::Migration[5.0]
  def change
    create_table :event_heats do |t|
      t.references :swim_meet, foreign_key: true, null: false
      t.references :swim_event, foreign_key: true, null: false
      t.integer :heat_number
      t.timestamps
    end
  end
end
