class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 15 }
  validates_uniqueness_of :name
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
end
