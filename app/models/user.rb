class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :expense_categories, dependent: :destroy
end
