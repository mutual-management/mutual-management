module Common
  extend ActiveSupport::Concern

  def integer_string?(key)
    Integer(key)
    true
  rescue ArgumentError
    false
  end
end