class User < ActiveRecord::Base
	require 'digest/md5'

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :lastlogin
  before_save :encrypt_password

  validates :first_name,
  	:presence => true,
  	:length => {
  		:minimum => 2,
  		:allow_blanc => true,
  		:maximum => 30
  	}

  	validates :last_name,
  	:presence => true,
  	:length => {
  		:minimum => 2,
  		:allow_blanc => true,
  		:maximum => 30
  	}

  	validates :password,
  	:presence => true,
  	:length => {
  		:minimum => 6,
  		:allow_blanc => true,
  	},
  	:confirmation => true

  	validates :password_confirmation,
  	:presence => true
  	
  	validates :email,
  	:presence => true,
	  :uniqueness => true

	

	def encrypt_password
		self.password = Digest::MD5.hexdigest(password)
	end

	def self.validate_login(email, password)
		user = User.find_by_email(email)

		if user && user.password == Digest::MD5.hexdigest(password)
			user
		else
			nil
		end
	end
end
