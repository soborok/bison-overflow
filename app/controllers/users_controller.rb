class UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def show
		@user = current_user || User.find(params[:id])
    @questions = Question.where(user_id: @user.id)
    @answers = Answer.where(user_id: @user.id)
	end

	def login
		@user = User.new
	end

	def new    #signup form
		@user = User.new
	end

end
