class User < ApplicationRecord
  authenticates_with_sorcery!
<<<<<<< HEAD
  has_many :topics, dependent: :destory
=======
>>>>>>> develop
end
