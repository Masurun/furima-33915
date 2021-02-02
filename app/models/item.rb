class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :deliver_burden
  belongs_to :pref
  belongs_to :deliver_date
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :deliver_burden_id
    validates :pref_id
    validates :deliver_date_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :deliver_burden_id
    validates :pref_id
    validates :deliver_date_id
    validates :sell_price
    
  end
  validates :sell_price,numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :name,length:{maximum:40}
  validates :description,length:{maximum:1000}
  belongs_to :user
  has_one_attached :image
end
