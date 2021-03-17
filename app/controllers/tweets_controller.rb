class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc).limit(20)
    
  end

  def new
    @tweet = TweetsTag.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end
  
  def create
    @tweet = TweetsTag.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def look
    @tweets = Tweet.search(params[:keyword])
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE? ', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private 

  def tweet_params
    params.require(:tweets_tag).permit(:message, :name).merge(user_id: current_user.id)
  end
end
