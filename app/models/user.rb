# frozen_string_literal: true

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  has_many :articles, dependent: :destroy
  # validates :username, presence: true,
  #                      uniqueness: { case_sensitive: false },
  #                      length: { minimum: 3, maximum: 25 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  # validates :email, presence: true,
  #                   uniqueness: { case_sensitive: false },
  #                   length: { maximum: 105 },
  #                   format: { with: VALID_EMAIL_REGEX }
  # has_secure_password
end
