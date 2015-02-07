class SessionsController < ActionController::Base

  def login
    if @user = User.authenticate(user_params[:email], user_params[:password])
      session[:user_id] = @user.id
    else
      flash[:message] = "Please try again."
    end
    redirect_to root_path
  end

  def signup
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end
  

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
