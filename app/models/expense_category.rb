class ExpenseCategory < ApplicationRecord
  EXPENSE_CATEGORY_ID_FOR_STUDY_OR_OTHER_DAILY_STACKS = 1 # DailyStackのうち支出でないものは支出カテゴリIDを1とする

  belongs_to :user

  validates :title, presence: true, length: { maximum: 16 }

  scope :active, -> {where(delete_flag: false)}
  scope :is_expense, -> {where.not(id: EXPENSE_CATEGORY_ID_FOR_STUDY_OR_OTHER_DAILY_STACKS)} # DailyStackのうち支出
end
