require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'バリデーション' do
    context '正常系' do
      it '全項目入力してあればtopicを投稿できる' do
      end
    end
    context '異常系' do
      it 'contentが空文字ならバリデーションが成功する' do
      end
      it 'contentが最大文字数が164以上ならバリデーションが成功する' do
      end
      it 'monthが未入力ならバリデーションが成功する' do
      end
    end
  end
end
