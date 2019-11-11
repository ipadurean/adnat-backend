class User < ApplicationRecord
  # belongs_to :organisation
  has_secure_password
  # validates :password_digest, length: { minimum: 6 }
  
end
