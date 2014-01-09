class Person < ActiveRecord::Base
  #default_scope :conditions => "people.user_id == User.current_user_id"
  #default_scope :conditions => {:user_id => @current_user_id}
  #default_scope where(:user_id => @current_user_id)

  belongs_to :user, :inverse_of => :people

  attr_accessible :bild, :email, :first_name, :geburtsdatum, :last_name, :telefon_fest, :telefon_mobil, :user_id


  end
