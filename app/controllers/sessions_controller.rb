class SessionsController < ApplicationController

  def login_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end

  def new
      
  end

  def create
    if User.find_by_user_id(login_params[:user_id]) != nil
      @user = User.find_by_user_id(login_params[:user_id])
      if @user.email == login_params[:email]
        session[:session_token] = @user.session_token
        flash[:notice] = "You are logged in as #{login_params[:user_id]}."
        redirect_to movies_path
        #login succesful
      else
        flash[:notice] = {:class => 'flash_message', :body => "Invalid User-ID/Email combination."}
        redirect_to login_path
      end
    else
      flash[:notice] = {:class => 'flash_message', :body => "Invalid User-ID/Email combination."}
      redirect_to login_path
    end
    
  end
  
  def destroy
    session.clear
    redirect_to movies_path
  end
  
end
  