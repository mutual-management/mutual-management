class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :expense_categories, dependent: :destroy
  has_many :daily_stacks, dependent: :destroy
end
