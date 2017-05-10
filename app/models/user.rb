class User < ApplicationRecord

  attr_accessor :password_confirmation
  before_save :encrypt_password

  validates_confirmation_of :password_digest
  validates_presence_of :password_digest, :on => :create
  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end


  private
  def encrypt_password
    if password_digest.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password_digest, password_salt)

    end
  end

end
