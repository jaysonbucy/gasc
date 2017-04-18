class CreateSwimMeets < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_meets do |t|
      t.string :name, null: false
      t.timestamp :date, null: false

      t.timestamps
    end
  end
end
