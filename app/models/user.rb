class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true


  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :family_name
      validates :first_name
      validates :family_read
      validates :first_read
    end
  end
  
  validates :birthday, presence: true

  
end
