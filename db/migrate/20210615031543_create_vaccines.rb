class CreateVaccines < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccines do |t|
      t.string :vaccine_name
      t.string :product_name
      t.string :company_name

      t.timestamps
    end
  end
end
