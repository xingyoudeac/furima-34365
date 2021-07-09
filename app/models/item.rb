class Item < ApplicationRecord
  belongs_to :user
  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_read, presence: true
  validates :first_read, presence: true
  validates :birthday, presence: true
end