class CreateVaccinations < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccinations do |t|
      t.string :who_region
      t.date :date_updated
      t.integer :total_vaccinations
      t.integer :persons_vaccinated_1plus_dose
      t.float :total_vaccinations_per100
      t.float :persons_vaccinated_1plus_dose_per100
      t.date :first_vaccine_date

      t.timestamps
    end
  end
end
