class CreateSwimForms < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_forms do |t|
      t.string :description, null: false
      t.string :url, null: false
      t.boolean :active, null: false, default: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
