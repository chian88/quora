class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User successfully registered."
      redirect_to root_path
    else
      flash[:warning] = "Something wrong with your registration process"
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User profile successfully updated"
      redirect_to user_path(@user)
    else
      flash[:warning] = "Something went wrong with updating your profile"
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :location, :description, :work, topic_ids: [])
  end
end