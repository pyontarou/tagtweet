class Tweet < ApplicationRecord
  has_many :tweet_tag_relations,dependent: :destroy
  has_many :tags, through: :tweet_tag_relations
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :message, presence: true

  def self.search(look)
    if look != ""
      Tweet.where('message LIKE(?)',"%#{look}%")
    else
      Tweet.all
    end
  end
end
