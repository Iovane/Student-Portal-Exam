# app/controllers/admin/lecturers_controller.rb
class LecturersController < ApplicationController
  before_action :set_subject, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_admin

  def new
    @lecturer = @subject.lecturers.build
  end

  def create
    @lecturer = @subject.lecturers.build(lecturer_params)

    if @lecturer.save
      redirect_to subject_path(@subject), notice: 'Lecturer was successfully created.'
    else
      render :new
    end
  end

  def edit
    @lecturer = @subject.lecturers.find(params[:id])
  end

  def update
    @lecturer = @subject.lecturers.find(params[:id])

    if @lecturer.update(lecturer_params)
      redirect_to subject_path(@subject), notice: 'Lecturer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lecturer = @subject.lecturers.find(params[:id])
    @lecturer.destroy

    redirect_to subject_path(@subject), notice: 'Lecturer was successfully destroyed.'
  end

  private

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def lecturer_params
    params.require(:lecturer).permit(:name, :from_time, :to_time, :scheduled_date)
  end

  def authorize_admin
    redirect_to root_path, alert: 'You do not have permission to perform this action.' unless current_user.admin?
  end
end
