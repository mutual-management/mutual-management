require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'バリデーション' do
    let (:topic) { build(:topic) }
    context '正常系' do
      it '全項目入力されていれば投稿できる' do
        expect(topic.valid?).to eq(true)
      end
    end
    context '異常系' do
      it 'contentが空文字ならバリデーションが成功する' do
        topic.content = ''
        expect(topic.valid?).to eq(false)
      end
      it 'contentが最大文字数が164以上ならバリデーションが成功する' do
        topic.content = "a" * 164
        expect(topic.valid?).to eq(false)
      end
      it 'monthが未入力ならバリデーションが成功する' do
        topic.month = ''
        expect(topic.valid?).to eq(false)
      end
    end
  end
end
