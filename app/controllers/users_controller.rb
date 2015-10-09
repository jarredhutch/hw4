class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email)
  end

  def show
  end

  def index
  end

  def new
  end

  def create
    if User.find_by_user_id(user_params[:user_id]) != nil
      flash[:notice] = {:class => 'flash_message', :body => "Sorry, this user ID is already taken. Try again."}
      redirect_to new_user_path
    else
      flash[:notice] = {:class => 'flash_message', :body => "Welcome #{user_params[:user_id]}. Your account has been created."}
      User.create_user!(user_params)
      redirect_to login_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end