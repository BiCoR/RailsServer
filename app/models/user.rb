# encoding: utf-8

class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :failed_attempts, :admin
  # attr_accessible :title, :body

  has_many :people, :inverse_of => :user, :dependent => :delete_all

  class << self
    def current_user_id=(user_id)
      Thread.current[:current_user_id] = user_id
    end

    def current_user_id
      Thread.current[:current_user_id]
      #get_current_user_id
    end
  end

  def isAdmin?
    admin
  end
end
