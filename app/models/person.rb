# encoding: utf-8

class Person < ActiveRecord::Base
  #default_scope :conditions => "people.user_id == User.current_user_id"
  #default_scope :conditions => {:user_id => @current_user_id}
  #default_scope where(:user_id => @current_user_id)

  belongs_to :user, :inverse_of => :people

  attr_accessible :email, :first_name, :geburtsdatum, :last_name, :telefon_fest, :telefon_mobil, :user_id, :image_file

  def image_file=(input_data)
    #self.filename = input_data.original_filename
    #self.content_type = input_data.content_type.chomp
    self.bild = input_data.read
  end

  def bild
    ''
  end

  end
