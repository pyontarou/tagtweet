class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets 
  has_many :comments 
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  validates :password , format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message:'英字と数字の両方を含めて設定してください' }  

  with_options presence: true do
    validates :nickname
    validates :birth_day

    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください'} do
      validates :family_name
      validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'} do
      validates :family_name_kana 
      validates :first_name_kana
    end
  end

  def like(tweet)
    likes.find_or_create_by(tweet: tweet)
  end
  
  def like?(tweet)
    like_tweets.include?(tweet)
  end
  
  def unlike(tweet)
    like_tweets.delete(tweet)
  end
end
