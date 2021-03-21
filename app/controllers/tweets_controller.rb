class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search,:look, :seek]
  before_action :set_q, only: [:index, :look, :seek]

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc).limit(30)
    @like = Like.new
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

  def seek
    @results = @q.result.includes(:user)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  private 

  def set_q
    @q = Tweet.ransack(params[:q]) 
  end

  def tweet_params
    params.require(:tweets_tag).permit(:message,:name).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
