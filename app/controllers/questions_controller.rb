class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy ]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:success] = "New question asked"
      redirect_to root_path
    else
      flash.now[:error] = "Question not asked"
      render :new
    end
  end

  def show
  end

  def edit
    unless @question.user == current_user
      flash[:alert] = "You can only edit your own question."
      redirect_to root_path 
    end
  end

  def update
    unless @question.user == current_user
      flash[:danger] = "You can only edit your own question."
      redirect_to root_path 
    else

      if @question = Question.update(question_params)
        flash[:success] = "Question was updated"
        redirect_to @question

      else
        flash.now[:error] = "Question was not updated"
        render :edit
      end
    end
  end

  def destroy
    unless @question.user == current_user
      flash[:danger] = "You can only delete your own question."
      redirect_to root_path 
    else

      if @question.destroy
        flash[:success] = "Question was deleted"
        redirect_to root_path
      end
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

  def set_question
    @question = Question.find(params[:id])

  end
end
