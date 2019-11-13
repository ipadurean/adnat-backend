class User < ApplicationRecord
  has_secure_password
  has_many :shifts
  validates_presence_of :name, :email, :password, :on => :create
  
  def send_password_reset
    UserMailer.password_reset(self).deliver
  end
end
