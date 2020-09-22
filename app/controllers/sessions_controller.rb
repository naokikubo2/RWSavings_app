class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      @current_user = @user
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/login'
  end
end
