class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all

  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.tdate = Time.current
    

    if @tweet.save
      redirect_to @tweet, notice: 'ツイートが作成されました'
    else
      redirect_to @tweet, notice: 'メッセージが空か、140文字を超えています'
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'ツイートが更新されました'
    else
      redirect_to @tweet, notice: 'メッセージが空か、140文字を超えています'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
  end
  


  private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :image)
  end
  
end