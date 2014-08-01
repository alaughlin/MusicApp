class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :reset_session_token!

  has_many(
    :notes,
    :class_name => "Note",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token ||= User::generate_session_token
  end

  def ensure_session_token

  end

  def password
    @password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pw = BCrypt::Password.new(self.password_digest)
    pw.is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return unless user
    if user.is_password?(password)
      user
    end
  end
end