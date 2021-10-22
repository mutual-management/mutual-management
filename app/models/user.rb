class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :topics, dependent: :destory
end
