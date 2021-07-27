class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :year_period
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name

    with_options numericality: { greater_than: 0,allow_blank: true }, format: { with: /\A[0-9]+\z/,allow_blank: true } do
      validates :price
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥０-９]+\z/, allow_blank: true } do
      validates :lecture
      validates :teacher
      validates :author
      validates :publisher
    end

    with_options numericality: { other_than: 1, message: "を選択してください"} do
      validates :year_period_id
      validates :sales_status_id
      validates :scheduled_delivery_id
    end
  end
end