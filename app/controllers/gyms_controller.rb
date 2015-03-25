class GymsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @gyms = Gym.paginate(page: params[:page])
  end
  
  def show
    @gym = Gym.find(params[:id])
  end
  
  def new
    @gym = Gym.new
    @gym.build_user
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      @gym.user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @gym = Gym.find(params[:id])
  end
  
  def update
    @gym = Gym.find(params[:id])
    if @gym.update_attributes(gym_params)
      
      flash[:success] = "Profile successfully updated"
      redirect_to @gym
    else
      render 'edit'
    end
  end
  
  def destroy
    Gym.find(params[:id]).destroy 
    redirect_to gyms_path
  end
  
  private
  
    def gym_params
      params.require(:gym).permit(user_attributes: [:id, :name, :email, :password, :password_confirmation])
    end
    
    def correct_user
      @gym = Gym.find(params[:id])
      redirect_to root_url unless current_user?(@gym.user)
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
