class SignupController < ApplicationController
  def index
  end

  def create
    if user = User.create(user_params)
      SignupMailer.delay.new_signup(user)
      flash[:success] = 'Thank you an email will be sent shortly.'
    else
      flash[:error] = 'A user with this email already exists.'
    end
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
