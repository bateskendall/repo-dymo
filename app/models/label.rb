class Label < ApplicationRecord
  validates :name, uniqueness: true
end
