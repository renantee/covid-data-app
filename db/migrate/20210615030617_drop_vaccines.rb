class DropVaccines < ActiveRecord::Migration[6.1]
  def change
    drop_table :vaccines, force: :cascade
  end
end