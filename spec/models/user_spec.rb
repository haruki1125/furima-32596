require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      # 新規登録/ユーザー情報
      it 'nicknameが空だと登録できない' do # ニックネームが必須であること
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do # メールアドレスが必須であること
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do # メールアドレスが一意性であること
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@がないと登録できない' do # メールアドレスは、@を含む必要があること
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do # パスワードが必須であること
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do # パスワードは、6文字以上での入力が必須であること
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do # パスワードは、確認用を含めて2回入力すること
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角数字のみの場合は登録できない' do # パスワードは、半角英数字混合での入力が必須であること
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end
      it 'passwordが半角英字のみの場合は登録できない' do # パスワードは、半角英数字混合での入力が必須であること
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角では登録できない' do # パスワードは、半角英数字混合での入力が必須であること
        @user.password = 'tfd１１１'
        @user.password_confirmation = 'tfd１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end
      it 'パスワードとパスワード（確認用）、値が一致しないと登録できない' do # パスワードとパスワード（確認用）、値の一致が必須であること
        @user.password = 'haru11'
        @user.password_confirmation = 'haru22'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # 新規登録/本人情報確認
      it 'ユーザー本名は、名字がないと登録できない' do # ユーザー本名は、名字と名前がそれぞれ必須であること
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名は、名前がないと登録できない' do # ユーザー本名は、名字と名前がそれぞれ必須であること
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名字は、全角（漢字・ひらがな・カタカナ)出ないと登録できない' do # ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
        @user.last_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）のみで入力して下さい')
      end
      it '名前は、全角（漢字・ひらがな・カタカナ)出ないと登録できない' do # ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
        @user.first_name = '2222'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）のみで入力して下さい')
      end
      it '名字のフリガナがないと登録できない' do # ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前のフリガナがないと登録できない' do # ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名字のフリガナは、全角（カタカナ）でないと登録できない' do # ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
        @user.last_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end
      it '名前のフリガナは、全角（カタカナ）でないと登録できない' do # ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end
      it '生年月日がないと登録できない' do # 生年月日が必須であること
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
    end
  end
end
