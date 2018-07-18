class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate(params[:session][:password])
      log_in @user
      check_user
      redirect_to @user
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def check_user
    if params[:session][:remember_me] == "1"
      remember(@user)
    else
      forget(@user)
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
