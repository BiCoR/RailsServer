class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean,  :null => false, :default => false
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :unlock_token,         :unique => true
  end
end
