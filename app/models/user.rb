class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets 
  has_many :comments 
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet    

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
