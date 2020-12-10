class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



        with_options presence: true do
          validates :nickname
          validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,message: '全角（漢字・ひらがな・カタカナ）のみで入力して下さい'}
          validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,message: '全角（漢字・ひらがな・カタカナ）のみで入力して下さい'}
          validates :last_name_kana, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: '全角カタカナのみで入力して下さい'}
          validates :first_name_kana, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: '全角カタカナのみで入力して下さい'}
          validates :birthday
        end
        

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # 半角英数字のみ
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  # 上の二行でパスワードのバリデーションできる
end
