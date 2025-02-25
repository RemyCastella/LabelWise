class Scan < ApplicationRecord
  belongs_to :user
  belongs_to :food

  has_one_attached :photo
end
