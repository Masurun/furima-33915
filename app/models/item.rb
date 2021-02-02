class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 }
  belongs_to :status
  validates :status_id, numericality: { other_than: 1 }
  belongs_to :deliver_burden
  validates :deliver_burden_id, numericality: { other_than: 1 }
  belongs_to :pref
  validates :pref_id, numericality: { other_than: 1 }
  belongs_to :deliver_date
  validates :deliver_date_id, numericality: { other_than: 1 }

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
  belongs_to :user
  has_one_attached :image
end
