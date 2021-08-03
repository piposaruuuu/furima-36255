require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに＠が含まれていない場合は登録できない' do
        @user.email = 'sample.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank","Password is invalid. Include both letters and numbers","Password confirmation doesn't match Password"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)", "Password is invalid. Include both letters and numbers"
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a6'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password is invalid. Include both letters and numbers"
      end

    end



  end


end
 


# ・メールアドレスが必須であること。
#・メールアドレスが一意性であること。
#・メールアドレスは、@を含む必要があること。
#・パスワードが必須であること。
#・パスワードは、6文字以上での入力が必須であること。
#・パスワードとパスワード（確認）は、値の一致が必須であること。