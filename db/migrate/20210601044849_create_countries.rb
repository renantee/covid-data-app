class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :country
      t.string :iso2
      t.string :iso3
      t.string :numeric_code
      t.string :latitude_average
      t.string :longitude_average

      t.timestamps
    end
  end
end
