class AddUserRefToPeople < ActiveRecord::Migration
  def change
    #change_table :people.references :user, index: true
    add_column :people, :user_id, :integer, index: true, references: :users
  end
end
