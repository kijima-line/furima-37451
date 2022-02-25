class Item < ApplicationRecord
  validates :title,         presence: true
  validates :image,         presence: true
  validates :description,   presence: true
  validates :status_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :buy_cost_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :buy_day_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :sale,          presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                            format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }

  has_one_attached :image
  belongs_to :user
  has_one :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :buy_cost
  belongs_to :buy_day
end
