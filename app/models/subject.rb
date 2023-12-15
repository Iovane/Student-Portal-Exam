# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :lecturers, dependent: :destroy
  # accepts_nested_attributes_for :lecturers, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
