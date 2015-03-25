class ClimbersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @climbers = Climber.paginate(page: params[:page])
  end
  
  def show
    @climber = Climber.find(params[:id])
  end
  
  def new
    @climber = Climber.new
    @climber.build_user
  end

  def create
    @climber = Climber.new(climber_params)
    if @climber.save
      @climber.user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @climber = Climber.find(params[:id])
  end
  
  def update
    @climber = Climber.find(params[:id])
    if @climber.update_attributes(climber_params)
      flash[:success] = "Profile successfully updated"
      redirect_to @climber
    else
      render 'edit'
    end
  end
  
  def destroy
    Climber.find(params[:id]).destroy 
    redirect_to climbers_path
  end
  
  private
  
    def climber_params
      params.require(:climber).permit(user_attributes: [:id, :name, :email, :password, :password_confirmation])
    end
  
    def correct_user
      @climber = Climber.find(params[:id])
      redirect_to root_url unless current_user?(@climber.user)
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
