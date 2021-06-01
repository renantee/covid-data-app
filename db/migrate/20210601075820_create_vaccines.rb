class CreateVaccines < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccines do |t|
      t.string :iso3
      t.string :vaccine_name
      t.string :product_name
      t.string :company_name
      t.date :authorization_date
      t.date :start_date
      t.date :end_date
      t.string :comment
      t.integer :data_source

      t.timestamps
    end
  end
end
