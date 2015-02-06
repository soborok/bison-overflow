class SessionsController < ActionController::Base

  def login
    if @user = User.authenticate(user_params[:email], user_params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:message] = "Please try again."
      redirect_to login_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to login_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
