class User < ApplicationRecord
  has_many :questions
  has_many :requests, dependent: :destroy

  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
