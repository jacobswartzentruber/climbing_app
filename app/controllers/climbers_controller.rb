class ClimbersController < ApplicationController
  
  def index
    @climbers = Climber.all
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
      flash[:success] = "Climber created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
  
    def climber_params
      params.require(:climber).permit(user_attributes: [:name, :email, :password, :password_confirmation])
    end
  
end
