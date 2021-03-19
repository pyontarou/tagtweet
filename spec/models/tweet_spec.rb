require 'rails_helper'

describe Tweet do
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  describe 'コメント機能' do
    context 'コメントが保存できるとき' do
      it 'テキストがあれば投稿できる' do
        @tweet.message = 'あいうえお'
        expect(@tweet).to be_valid
      end
    end
    context 'コメントが保存できないとき' do
      it 'テキストが空では投稿できない' do
        @tweet.message = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Message can't be blank")
      end 
  
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
