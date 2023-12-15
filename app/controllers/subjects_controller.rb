# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :authorize_admin, except: [:show, :index]
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end


  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to @subject, notice: "Subject was successfully created"
    else
      flash.now[:alert] = @subject.errors.full_messages[0]
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: "Subject was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: "Subject was deleted successfully"
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def authorize_admin
    redirect_to root_path, alert: 'You do not have permission to perform this action.' unless current_user.admin?
  end
end
