class User < ApplicationRecord
  has_many :scans, dependent: :destroy
  has_many :portions, dependent: :destroy
  has_many :foods, through: :scans

  acts_as_favoritor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
