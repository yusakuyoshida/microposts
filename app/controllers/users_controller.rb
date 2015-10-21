class UsersController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  def show
    @user=User.find(params[:id])
    @microposts=@user.microposts
  end
  
  def new
    @user=User.new
  end
    
  def create
    @user=User.new(user_params)
    if @user.save
     session[:user_id] = @user.id
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
  
  def followings
    @user=User.find(params[:id])
    @followings=@user.following_users
  end
  
  def followers
    @user=User.find(params[:id])
    @followers=@user.follower_users
  end
  
  def index
    @users=User.all
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :profile)
  end
  
  def set_message
    @user=User.find(params[:id])
    redirect_to root_path unless @user ==  User.find_by(id:session[:user_id])
  end
end
