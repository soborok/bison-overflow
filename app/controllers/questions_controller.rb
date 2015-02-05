class QuestionsController < ActionController::Base

  def index
    @questions = Question.all
    render :'questions/index'
  end

  def create
    puts params
    @question = Question.new(question_params)
    if @question.save
      redirect_to "/questions"
    else
      flash[:errors] = "oopsies"
      redirect_to :back
    end
  end

  def new
    @thing = Question.new
    render :"questions/new"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
