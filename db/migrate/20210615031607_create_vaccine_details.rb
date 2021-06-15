class CreateVaccineDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccine_details do |t|
      t.references :vaccine, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.date :authorization_date
      t.date :start_date
      t.date :end_date
      t.string :comment
      t.integer :data_source

      t.timestamps
    end
  end
end
