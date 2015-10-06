class UsersController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  def show
    @user=User.find(params[:id])
  end
  
  def new
    @user=User.new
  end
    
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success]= "プロフィールを編集しました"
      redirect_to @user
    else
      render 'edit' 
    end 
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :profile)
  end
  
  def set_message
    @user=User.find(params[:id])
  end
end
