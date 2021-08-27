class Address < ApplicationRecord
  belongs_to :order

  validates :prefecture_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
end
