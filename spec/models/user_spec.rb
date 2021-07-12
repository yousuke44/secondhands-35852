require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(1)
  end

  describe '会員新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmetion,universitey_id,department_id,birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailが@を含まない場合は登録できないこと' do
        @user.email = 'testcode.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空だと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下だと登録できないこと' do
        @user.password = 'aaa11'
        @user.password_confirmation ='aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字だけだと登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordが英字だけだと登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordは全角だと登録できないこと' do
        @user.password = '１１１ＡＡＡ'
        @user.password_confirmation = '１１１ＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordとpassword_confirmetionが不一致だと登録できないこと' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'university_idは1では登録できないこと'do
        @user.university_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("大学名を選択してください")
      end
      it 'department_idは1では登録できないこと' do
        @user.department_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("学部名を選択してください")
      end
      it '生年月日が空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
