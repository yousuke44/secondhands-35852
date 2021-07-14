require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep(1)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'name,price,year_period_id,lecture,teacher,sales_status_id,scheduled_delivery_id,author,publisher,imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'nameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'priceが空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格を入力してください")
      end
      it 'priceが全角数字では出品できないこと' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'priceが半角英字では出品できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'priceが全角英字では出品できないこと' do
        @item.price = 'ＡＡＡＡＡＡ'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'priceがひらがなでは出品できないこと' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'priceが漢字では出品できないこと' do
        @item.price = '漢字漢字'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'priceがカタカナ（全角）では出品できないこと' do
        @item.price = 'アアアア'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'priceがカタカナ（半角）では出品できないこと' do
        @item.price = 'ｱｱｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end
      it 'year_period_idが1では出品できないこと' do
        @item.year_period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("年度・受講期を選択してください")
      end
      it 'lectureが空では出品できないこと' do
        @item.lecture = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("講義名を入力してください")
      end
      it 'lectureがカタカナ（半角）では出品できないこと' do
        @item.lecture = 'ｱｱｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("講義名は不正な値です")
      end
      it 'lectureが英字（半角）では出品できないこと' do
        @item.lecture = 'AAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("講義名は不正な値です")
      end
      it 'lectureが数字（半角）では出品できないこと' do
        @item.lecture = '1111'
        @item.valid?
        expect(@item.errors.full_messages).to include("講義名は不正な値です")
      end
      it 'teacherが空では出品できないこと' do
        @item.teacher = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("先生名を入力してください")
      end
      it 'teacherがカタカナ（半角）では出品できないこと' do
        @item.teacher = 'ｱｱｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("先生名は不正な値です")
      end
      it 'teacherが英字（半角）では出品できないこと' do
        @item.teacher = 'AAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("先生名は不正な値です")
      end
      it 'teacherが数字（半角）では出品できないこと' do
        @item.teacher = '1111'
        @item.valid?
        expect(@item.errors.full_messages).to include("先生名は不正な値です")
      end
      it 'sales_status_idが1では出品できないこと' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'scheduled_delivery_idが1では出品できないこと' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'authorが空では出品できないこと' do
        @item.author = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("著者名を入力してください")
      end
      it 'authorがカタカナ（半角）では出品できないこと' do
        @item.author = 'ｱｱｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("著者名は不正な値です")
      end
      it 'authorが英字（半角）では出品できないこと' do
        @item.author = 'AAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("著者名は不正な値です")
      end
      it 'authorが数字（半角）では出品できないこと' do
        @item.author = '1111'
        @item.valid?
        expect(@item.errors.full_messages).to include("著者名は不正な値です")
      end
      it 'publisherが空では出品できないこと' do
        @item.publisher = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("出版社名を入力してください")
      end
      it 'publisherがカタカナ（半角）では出品できないこと' do
        @item.publisher = 'ｱｱｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("出版社名は不正な値です")
      end
      it 'publisherが英字（半角）では出品できないこと' do
        @item.publisher = 'AAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("出版社名は不正な値です")
      end
      it 'publisherが数字（半角）では出品できないこと' do
        @item.publisher = '1111'
        @item.valid?
        expect(@item.errors.full_messages).to include("出版社名は不正な値です")
      end
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'userが紐付いていないと登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("会員名を入力してください")
      end
    end
  end
end