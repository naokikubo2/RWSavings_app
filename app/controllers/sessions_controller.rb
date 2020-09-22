class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      @current_user = @user
      flash[:success] = 'ログインに成功しました'
      redirect_to '/'
    else
      flash[:warning] = 'ログインに失敗しました'
      redirect_to '/login'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
    redirect_to '/login'
  end
end
