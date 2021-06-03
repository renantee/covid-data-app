class CreateCsvVaccinations < ActiveRecord::Migration[6.1]
  def change
    create_table :csv_vaccinations do |t|
      t.string :country
      t.string :iso3
      t.string :who_region
      t.string :data_source
      t.date :date_updated
      t.integer :total_vaccinations
      t.integer :persons_vaccinated_1plus_dose
      t.float :total_vaccinations_per100
      t.float :persons_vaccinated_1plus_dose_per100
      t.string :vaccines_used
      t.date :first_vaccine_date
      t.string :number_vaccines_types_used

      t.timestamps
    end
  end
end
