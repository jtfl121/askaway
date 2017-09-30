class QuestionsController < ApplicationController

  def index
    @questions = Question.all
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

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question = Question.update(question_params)
      flash[:success] = "Question was updated"
      redirect_to @question

    else
      flash.now[:error] = "Question was not updated"
      render :edit
    end

  end

  protected
    def resource_not_found
    message = "The question you are looking for could not be found" 
    flash[:alert] = message
    redirect_to root_path
    end

  private

  def question_params
    params.require(:question).permit(:question)
  end

end
