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
          click_on 'カードを追加'
          fill_in 'タップしてTopicを入力してください', with: ''
          click_on '登録'
          expect(page).to have_content 'Topicの作成に失敗しました'
        end
        it 'topicが164文字以上だとtopicが投稿できない' do
          click_on 'カードを追加'
          fill_in 'タップしてTopicを入力してください', with: 'あ' * 164
          click_on '登録'
          expect(page).to have_content 'Topicの作成に失敗しました'
        end
      end
    end
  end
  describe 'topicの更新' do
    context 'topicをクリックするとモーダルが表示されて鉛筆マークをクリックすると編集可能状態になる' do
      context '正常系' do
        it '更新ボタンをクリックするとtopicが更新される' do
          page.first(".block").click
          page.first(".fa-edit").click
          find(".edit_topic").set("やの")
          click_on '更新'
          expect(page).to have_content 'Topicを更新しました'
        end
      end
      context '異常系' do
        it 'topicが空で更新ボタンをクリックするとtopicが更新されない' do
          page.first(".block").click
          page.first(".fa-edit").click
          find(".edit_topic").set(" ")
          click_on '更新'
          expect(page).to have_content 'Topicの更新に失敗しました'
        end
        it 'topicが164文字以上だとtopicが更新されない' do
          page.first(".block").click
          page.first(".fa-edit").click
          find(".edit_topic").set("や" * 164)
          click_on '更新'
          expect(page).to have_content 'Topicの更新に失敗しました'
        end
      end
    end
  end
  describe 'topicの削除' do
    it 'ゴミ箱をクリックするとtopicが削除される' do
      page.accept_confirm do
        click_on 'delete-topic'
      end
      expect(page).to_not have_content 'yano'
    end
  end
end
