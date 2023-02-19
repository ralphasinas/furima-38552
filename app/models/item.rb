class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  has_one_attached :image
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_fee_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_area_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_day_id, numericality: { other_than: 0 , message: "can't be blank"}
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
  end

end
