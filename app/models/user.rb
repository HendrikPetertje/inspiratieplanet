class User < ActiveRecord::Base
  # link articles with users
  has_many :articles
  has_many :favorites
  has_many :reviews, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # make username required on register and edit and block out users that try to ommit this.
  validates_presence_of :name
  validates_uniqueness_of :name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :picture, :remember_me
  # attr_accessible :title, :body
  mount_uploader :picture, PictureUploader

end
