class QuestionsController < ApplicationController

  def index
    
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "New question asked"
      redirect_to root_path
    else
      flash.now[:error] = "Question not asked"
      render :new
    end
  end


  private

  def question_params
    params.require(:question).permit(:question)
  end

end
