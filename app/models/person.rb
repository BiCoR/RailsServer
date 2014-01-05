class Person < ActiveRecord::Base
  attr_accessible :bild, :email, :first_name, :geburtsdatum, :last_name, :telefon_fest, :telefon_mobil
end
