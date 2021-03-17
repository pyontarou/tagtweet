class TweetsTag

  include ActiveModel::Model
  attr_accessor :message, :name, :user_id

  with_options presence: true do
    validates :message
    validates :name
    validates :user_id
  end

  def save
    tweet = Tweet.create(message: message, user_id:user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end
end