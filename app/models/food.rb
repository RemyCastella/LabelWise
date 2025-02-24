class Food < ApplicationRecord
  # Associations
  has_many :scans
  has_many :portions

  # Validations
  validates :name, presence: true
end
