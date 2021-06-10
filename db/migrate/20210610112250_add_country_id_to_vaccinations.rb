class AddCountryIdToVaccinations < ActiveRecord::Migration[6.1]
  def change
    add_reference :vaccinations, :country, null: true, foreign_key: true
  end
end
