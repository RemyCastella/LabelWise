class Food < ApplicationRecord
  # Associations
  has_many :scans
  has_many :portions

  # Validations
  validates :name, presence: true
  acts_as_favoritable

  after_create_commit -> { broadcast_replace_to "food_#{id}", target: "food_details", partial: "foods/food", locals: { food: self } }

  def high_fat?
    30 > (fat / (carbohydrates + fat + protein) * 100)
  end

  def high_protein?
    20 > (protein / (carbohydrates + fat + protein) * 100)
  end

  def high_carbohydrates?
    50 > (carbohydrates / (carbohydrates + fat + protein) * 100)
  end
end
