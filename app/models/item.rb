class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :content
  belongs_to_active_hash :deliver_charge
  belongs_to_active_hash :deliver_day
  belongs_to_active_hash :prefecture
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
  validates :item_name, presence: true, length: { maximum: 40 }   
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # validates :price,format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :category_id, :content_id, :deliver_charge_id, :deliver_day_id, :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
end
