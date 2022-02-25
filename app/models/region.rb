class Region < ApplicationRecord
  # include ActiveModel::Model
  # attr_accessor :user_id,:post_code, :prefecture_id, :city, :building_name, :phone_number, :item_id, :user_id

  # with_options presence: true do
  #   validates :item_id
  #   validates :user_id
  #   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  #   validates :city
  #   validates :building_name
  #   validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
  # end
  # validates :prefecture_id, numericality: { other_than: 1 }
  # def save
  #   Buyer.create((item_id: item_id, user_id: user_id)
  #   Region.create(:post_code, 
  #     :prefecture_id, :city, :address_number, :building_name, :phone_number, buyer_id: buyer.id)
  # end
  belongs_to :buyer
end
