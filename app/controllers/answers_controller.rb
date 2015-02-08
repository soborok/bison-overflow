class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end

  def new
    question = Question.find_by(id: params[:question_id])
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:question_id])
    answer = Answer.create(answer_params)
    answer.user = current_user
    answer.question = question
    question.answers << answer
    redirect_to question_path(question)
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    answer.update_attributes(answer_params)
    redirect_to question_path(answer.question)
  end

  def destroy
    question = Question.find(params[:question_id])
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to question_path(question)
  end

  def answer_params
    params.require(:answer).permit(:content)
  end  

end
