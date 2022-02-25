class Address
  include ActiveModel::Model
  attr_accessor :user_id, :post_code, :prefecture_id, :city, :building_name, :phone_number, :item_id, :address_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address_number
    validates :phone_number,format: {with: /\A\d{10}\z|\A\d{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Region.create(post_code: post_code, prefecture_id: prefecture_id,
                  city: city, address_number: address_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
