class ExpenseCategory < ApplicationRecord
  belongs_to :user

  validate :title, presense: true, length: { maximum: 16 }
  validate :delete_flag, presense: true
end
