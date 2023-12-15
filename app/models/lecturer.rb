# frozen_string_literal: true

class Lecturer < ApplicationRecord
  belongs_to :subject
  has_many :requests, dependent: :destroy

  validates :name, presence: true
  validates :from_time, presence: true
  validates :to_time, presence: true
  validates :scheduled_date, presence: true

end
