class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user=User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_back_or_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private
    def redirect_back_or_to(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
end
