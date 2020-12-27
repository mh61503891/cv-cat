class Locale < ApplicationRecord
  validates :value,
    uniqueness: true,
    presence: true
end
