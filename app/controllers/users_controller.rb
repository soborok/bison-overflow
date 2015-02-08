class UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def show
		@user = User.find(params[:id]) || current_user
		@questions = Question.where(user_id: @user.id)
		@answers = Answer.where(user_id: @user.id)
	end

	def login
		@user = User.new
	end

	def new    #signup form
		@user = User.new
	end

  def answered_questions
  	user = User.find(params[:id]) || current_user
  	@answered_questions = user.answered_questions.uniq
	end

	helper_method :answered_questions
end
