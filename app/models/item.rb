class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category_id
  belongs_to_active_hash :content_id
  belongs_to_active_hash :deliver_charge_id
  belongs_to_active_hash :deliver_day_id
  belongs_to_active_hash :prefecture_id
  has_one_attached :image

  validates :category_id, :content_id, :deliver_charge_id, :deliver_day_id, :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
end
