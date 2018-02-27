class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: true
  validates :name, uniqueness: { message: 'já está em uso' }
end
