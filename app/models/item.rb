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
    validates :image
  end
  
  validates :price           ,presence: true  ,numericality:  { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }  ,format: { with: /\A[0-9]+\z/ }

  with_options numericality:  { other_than: 1, message: "can't be blank" } do
    validates :category_id      
    validates :condition_id    
    validates :burden_id       
    validates :prefecture_id   
    validates :day_id
  end
  
end