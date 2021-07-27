require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空では保存できないこと'do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空の場合は保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postal_codeが全角では保存できないこと' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'prefecture_idが1では保存できないこと' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空では保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'last_nameが空では保存できないこと' do
        @order_address.last_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字を入力してください")
      end
      it 'last_nameが半角カタカナでは保存できない' do
        @order_address.last_name = 'ﾔﾏﾀﾞ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'last_nameが半角数字では保存できない' do
        @order_address.last_name = '111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'last_nameが全角数字では保存できない' do
        @order_address.last_name = '１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'last_nameが半角英字では保存できない' do
        @order_address.last_name = 'aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'last_nameが全角英字では保存できない' do
        @order_address.last_name = 'ＡＡＡ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'last_nameが記号を含むと保存できない' do
        @order_address.last_name = '山田!!!'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'first_nameが空では保存できないこと' do
        @order_address.first_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが半角カタカナでは保存できない' do
        @order_address.first_name = 'ﾔﾏﾀﾞ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'first_nameが半角数字では保存できない' do
        @order_address.first_name = '111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'first_nameが全角数字では保存できない' do
        @order_address.first_name = '１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'first_nameが半角英字では保存できない' do
        @order_address.first_name = 'aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'first_nameが全角英字では保存できない' do
        @order_address.first_name = 'ＡＡＡ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'first_nameが記号を含むと保存できない' do
        @order_address.first_name = '太郎!!!'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前はひらがな・漢字・全角カタカナを入力してください")
      end
      it 'last_name_kanaが空では保存できないこと' do
        @order_address.last_name_kana = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'last_name_kanaが半角カタカナでは保存できない' do
        @order_address.last_name_kana = 'ﾔﾏﾀﾞ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'last_name_kanaが半角数字では保存できない' do
        @order_address.last_name_kana = '111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'last_name_kanaが全角数字では保存できない' do
        @order_address.last_name_kana = '１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'last_name_kanaが半角英字では保存できない' do
        @order_address.last_name_kana = 'aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'last_name_kanaが全角英字では保存できない' do
        @order_address.last_name_kana = 'ＡＡＡ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'last_name_kanaが漢字では保存できない' do
        @order_address.last_name_kana = '山田'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'last_name_kanaが記号を含むと保存できない' do
        @order_address.last_name_kana = '太郎!!!'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名字(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが空では保存できないこと' do
        @order_address.first_name_kana = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'first_name_kanaが半角カタカナでは保存できない' do
        @order_address.first_name_kana = 'ﾔﾏﾀﾞ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが半角数字では保存できない' do
        @order_address.first_name_kana = '111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが全角数字では保存できない' do
        @order_address.first_name_kana = '１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが半角英字では保存できない' do
        @order_address.first_name_kana = 'aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが全角英字では保存できない' do
        @order_address.first_name_kana = 'ＡＡＡ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが漢字では保存できない' do
        @order_address.first_name_kana = '山田'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'first_name_kanaが記号を含むと保存できない' do
        @order_address.first_name_kana = '太郎!!!'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberがハイフンを含むと保存できないこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数字でハイフンを含まずに入力してください")
      end
      it 'phone_numberが10桁未満では保存できないこと' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数字でハイフンを含まずに入力してください")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数字でハイフンを含まずに入力してください")
      end
      it 'phone_numberが全角数字では保存できないこと' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数字でハイフンを含まずに入力してください")
      end
      it 'phone_numberが英数混合では保存できないこと' do
        @order_address.phone_number = 'o9o12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数字でハイフンを含まずに入力してください")
      end
      it 'userが紐づいていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end