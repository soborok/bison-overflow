class AnswersController < ApplicationController

  def index
    @thing = Answer.new
    @answers = Answer.all
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to answer_path(@answer)
    else
      flash[:errors] = "oopsies"
      redirect_to :back
    end
  end

  def new
    @thing = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def destroy
    answer = Answer.find(params[:id])
    Answer.destroy
    redirect_to answers_path
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(answer_params)
    redirect_to answer_path
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end
