class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days
  has_one_attached :image
  
  with_options presence: true do
    validates :title 
    validates :concept
    validates :category_id
    validates :burden_id
    validates :prefecture_id
    validates :days_id
    validates :price
    validates :image
  end
  
  with_options numericality: { other_than: 1 , message: "can't be blank"}
    validates :category
    validates :burden
    validates :prefecture
    validates :days
  end

