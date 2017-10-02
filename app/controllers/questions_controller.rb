class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy ]
  
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag])
    elsif params[:q]
      @questions = Question.search_for(params[:q])
    else
      @questions = Question.all
    end


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
    @answer = @question.answers.build
    @answers = Answer.where(question_id: params[:id])
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

       if @question.update_attributes(question_params)
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
    params.require(:question).permit(:question, :tag_list)
  end

  def set_question
    @question = Question.find(params[:id])

  end
end
