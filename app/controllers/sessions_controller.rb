class SessionsController < ApplicationController
  def create
    @user = User.find_by email: params[:email]

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully log in.'
      redirect_to questions_path
    else
      flash[:warning] = "Something wrong with your username or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully log out.'
    redirect_to root_path
  end
end