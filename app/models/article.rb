# frozen_string_literal: true

class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 800 }
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
end
