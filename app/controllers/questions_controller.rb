# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :questions_params, only: [:create]
  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.build(questions_params)

    if @question.save
      redirect_to root_path, notice: "Question list was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def questions_params
    params.require(:question).permit(:questions_list)
  end
end
