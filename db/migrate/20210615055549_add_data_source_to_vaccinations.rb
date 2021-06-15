class AddDataSourceToVaccinations < ActiveRecord::Migration[6.1]
  def change
    add_column :vaccinations, :data_source, :integer
  end
end
