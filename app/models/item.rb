class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions 
  
  
  belongs_to :user          
  belongs_to :category      
  belongs_to :burden        
  belongs_to :prefecture    
  belongs_to :day          
  has_one_attached :image
  
  with_options presence: true do
    validates :title 
    validates :concept
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
    validates :price
    validates :image
  end
  
    validates :price           ,numericality:  {greater_than: 299, less_than: 10000000} ,format: { with: /\A[0-9]+\z/ }

    validates :category_id     ,numericality:  { other_than: 1, message: "can't be blank" } 
    validates :condition_id    ,numericality:  { other_than: 1, message: "can't be blank" }
    validates :burden_id       ,numericality:  { other_than: 1, message: "can't be blank" }
    validates :prefecture_id   ,numericality:  { other_than: 1, message: "can't be blank" }
    validates :day_id          ,numericality:  { other_than: 1, message: "can't be blank" }

end