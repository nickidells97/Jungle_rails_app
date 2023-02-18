class User < ApplicationRecord

  has_secure_password

  before_save {self.email = email.downcase.strip}

  validates :name, presence: true
  validates :email, presence: true
  validates :email, confirmation: { case_sensitive: false }
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }

  

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    
     if user.nil? or not user.authenticate password
      return nil
     end

    return user
  end

end
