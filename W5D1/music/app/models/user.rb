# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank!"}
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token


  attr_reader :password


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user && BCrypt::Password.new(user.password).is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    # makes a new session token
    self.session_token = User.generate_session_token
    # save this to database
    self.save!
    # pass this back
    self.session_token
  end

  # this rusn before vaidation, to ensure we have a session token
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(input)
    @password = input
    self.password_digest = BCrypt::Password.create(input)
  end

end
