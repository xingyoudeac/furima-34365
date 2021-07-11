class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    with_options format do
      nickname
    end
     with_options format {with:/\A[ぁ-んァ-ン一-龥]/} do
     end
      family_name
      first_name
     end
     with_options format {with:/\A[ァ-ヶー－]+\z/} do
      family_read
      first_read
     end
     with_options format do
      birthday
     end
 end

  has_many :items
  has_many :comments
  has_many :purchases
end
