class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,:password,:password_confirmation, presence: true
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_read, presence: true
  validates :first_read, presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :comments
  has_many :purchases
end
