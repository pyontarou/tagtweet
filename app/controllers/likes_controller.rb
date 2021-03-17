class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @tweet = Tweet.find(params[:tweet_id])
    current_user.like(@tweet)
  end
  
  def destroy
    @tweet = Like.find(params[:id]).tweet
    current_user.unlike(@tweet)
  end

end
