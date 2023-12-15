# app/models/request.rb
class Request < ApplicationRecord
  before_create :generate_request_code

  belongs_to :user
  belongs_to :lecturer

  validate :no_overlapping_lectures, on: :create

  validates :chosen_start, presence: true
  validates :chosen_end, presence: true
  validates :scheduled_date, presence: true


  private

  def generate_request_code
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    random_part = SecureRandom.hex(4) # You can adjust the length as needed
    self.request_code = "#{timestamp}-#{random_part}"
  end

  def no_overlapping_lectures
    if overlapping_requests.any?
      errors.add(:base, "You already have subject at this hours.")
    end
  end

  def overlapping_requests
    Request.where(lecturer_id: lecturer_id, scheduled_date: scheduled_date)
        .where(user_id: user_id, scheduled_date: scheduled_date)
        .where.not(id: id)
           .where("(scheduled_date = ?) AND ((chosen_start <= ? AND chosen_end >= ?) OR (chosen_start <= ? AND chosen_end >= ?))",
                  scheduled_date, chosen_end, chosen_end, chosen_start, chosen_start)
  end

  public
end
