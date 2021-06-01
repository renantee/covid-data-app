class AddColumnIsAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :boolean, after: :email
  end
end
