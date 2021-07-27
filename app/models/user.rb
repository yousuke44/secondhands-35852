class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :university
  belongs_to :department
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options numericality: { other_than: 1, message: "を選択してください" } do
      validates :university_id
      validates :department_id
    end
  end
  
  PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英字と半角数字の両方を含めて設定してください'
end
