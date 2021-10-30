class DailyStack < ApplicationRecord
  belongs_to :expense_category
  belongs_to :user

  enum status: { todo: 0, done: 1 }
  enum unit: { study: 0, expense: 1, others: 2 }

  validate :title, presense: true, length: { maximum: 50 }
  validate :status, presense: true
  validate :date, presense: true
  validate :unit, presense: true

end
