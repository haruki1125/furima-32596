class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true,
                        format: {
                          with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,
                          message: '全角（漢字・ひらがな・カタカナ）のみで入力して下さい'
                        }

  validates :first_name, presence: true,
                         format: {
                           with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,
                           message: '全角（漢字・ひらがな・カタカナ）のみで入力して下さい'
                         }

  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                               message: '全角カタカナのみで入力して下さい'
                             }
  validates :first_name_kana, presence: true,
                              format: {
                                with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                                message: '全角カタカナのみで入力して下さい'
                              }
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # 半角英数字のみ
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  # 上の二行でパスワードのバリデーションできる
end
