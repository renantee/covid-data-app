class AddCountryIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :country, null: false, 
                  default: 179, foreign_key: true
  end
end
