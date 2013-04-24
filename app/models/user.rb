class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = user.email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX },
 					 uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

  before_create { generate_token(:auth_token) }

  def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

end

