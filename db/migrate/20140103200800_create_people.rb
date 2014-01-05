class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :telefon_fest
      t.string :telefon_mobil
      t.date :geburtsdatum
      t.binary :bild

      t.timestamps
    end
  end
end
