require 'rails_helper'

RSpec.describe "Topics", type: :system do
  let! (:topic) { create(:topic) }
  before do
    visit topics_path
  end
  describe 'ページ遷移' do
    it '/topicsにアクセスすると現在の月のページが表示される' do
      expect(page).to have_content Time.zone.today.month
    end
    it '左矢印をクリックすると先月のページが表示される' do
      page.first(".begin-month").click
      expect(page).to have_content Time.zone.today.last_month.month
    end
    it '右矢印をクリックすると来月のページが表示される' do
      page.first(".next-month").click
      expect(page).to have_content Time.zone.today.next_month.month
    end
  end
  describe 'topicの投稿' do
    context 'カード追加ボタンを押すとモーダルが表示される' do
      context '正常系' do
        it '日付にデフォルトで当日の日付が表示されていて登録ボタンを押すとtopicが投稿できる' do
          click_on 'カードを追加'
          fill_in 'タップしてTopicを入力してください', with: 'yanoyano'
          click_on '登録'
          expect(page).to have_content 'Topicを作成しました'
        end
      end
      context '異常系' do
        it 'topicを空で登録ボタンを押すとtopicが投稿できない' do
        end
        it 'topicが164文字以上だとtopicが投稿できない' do
        end
      end
    end
  end
  describe 'topicの更新' do
    context 'topicをクリックするとモーダルが表示されて鉛筆マークをクリックすると編集可能状態になる' do
      context '正常系' do
        it '更新ボタンをクリックするとtopicが更新される' do
        end
      end
      context '異常系' do
        it 'topicが空で更新ボタンをクリックするとtopicが更新されない' do
        end
        it 'topicが164文字以上だとtopicが更新されない' do
        end
      end
    end
  end
  describe 'topicの削除' do
    it 'ゴミ箱をクリックするとtopicが削除される' do
    end
  end
end
