class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token

    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/,allow_blank: true, massage: 'はハイフンを含んで入力してください' } do
      validates :postal_code
    end

    with_options numericality: { other_than: 1, message: "を選択してください" } do
      validates :prefecture_id
    end

    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/,allow_blank: true, message: 'はひらがな・漢字・全角カタカナを入力してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶーー]+\z/,allow_blank: true, message: 'は全角カタカナで入力してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    with_options format: { with: /\A\d{10,11}\z/,allow_blank: true, message: 'は半角数字でハイフンを含まずに入力してください'} do
      validates :phone_number
    end
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                   last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, phone_number: phone_number, order_id: order.id)
  end
end