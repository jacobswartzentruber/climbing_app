class GymsController < ApplicationController
  
  def index
    @gyms = Gym.all
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
      flash[:success] = "Gym created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
  
    def gym_params
      params.require(:gym).permit(user_attributes: [:name, :email, :password, :password_confirmation])
    end
    
end
