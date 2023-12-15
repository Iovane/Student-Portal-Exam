# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :set_lecturer, only: [:new, :create]


  def index
    if current_user.admin?
      @requests = Request.all
    else
      @requests = current_user.requests
    end
  end
  def new
    @request = @lecturer.requests.new
  end

  def create

    @request = current_user.requests.build(request_params)
    @request.lecturer = @lecturer
    @request.chosen_start = @lecturer.from_time
    @request.chosen_end = @lecturer.to_time
    @request.scheduled_date = @lecturer.scheduled_date

    if @request.save
      redirect_to @lecturer.subject, notice: "Request was made"
    else

      flash.now[:messages] = @request.errors.full_messages[0]
      render :new, status: :unprocessable_entity
    end
  end



  private
  def request_params
    params.require(:request).permit(:request_code, :chosen_start, :chosen_end, :lecturer_id)
  end

  def set_lecturer
    @lecturer = Lecturer.find(params[:lecturer_id])
  end
end
