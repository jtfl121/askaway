class QuestionsController < ApplicationController

  def index
    
  end

  def new
    @question = Question.new
    
  end

  def create
    @question = Question.new(question_params)
    @question.save
    flash[:success] = "New question asked"
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
