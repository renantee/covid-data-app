class CreateVaccinationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccination_details do |t|
      t.references :vaccination, null: false, foreign_key: true
      t.references :vaccine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
