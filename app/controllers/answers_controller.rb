class AnswersController < ApplicationController

  before_action :set_question

  def create
    @answer = @question.answers.build(answers_params)
    @answer.user = current_user

    if @answer.save
      flash[:success] = "Your question was added"
    else
      flash[:error] = "Your question was not added"
    end
    redirect_to question_path(@question)
  end

  private

  def answers_params
    params.require(:answer).permit(:answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end



end