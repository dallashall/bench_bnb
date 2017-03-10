require "bcrypt"
class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password
  before_validation :set_token

  def gen_token
    SecureRandom.urlsafe_base64
  end

  def set_token
    self.session_token ||= gen_token
  end

  def reset_token!
    self.session_token = gen_token
    self.save
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
