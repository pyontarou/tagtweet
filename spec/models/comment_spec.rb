require 'rails_helper'

describe Comment do
  before do
    @comment = FactoryBot.build(:comment)
  end
    
  describe 'コメント機能' do
    context 'コメントが保存できるとき' do
      it 'textが存在していれば保存できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが保存できないとき' do
      it 'textが空では保存できないこと' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank" )
      end

      it 'userが紐づいていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      
      it 'tweetが紐づいていないと保存できないこと' do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Tweet must exist")
      end
    end
  end
end

