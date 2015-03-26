class RoutesController < ApplicationController
  
  def new
    @gym = Gym.find(params[:gym_id])
    @route = @gym.routes.build()
  end
  
  def create
    @gym = Gym.find(params[:gym_id])
    @route = @gym.routes.build(route_params)
    if @route.save
      flash[:success] = "Route saved"
      redirect_to @gym
    else
      render 'new'
    end
  end
  
  def index
    @gym = Gym.find(params[:id])
    @routes = @gym.routes
  end
  
  def show
    @gym = Gym.find(params[:gym_id])
    @route = @gym.routes.find(params[:id])
  end
  
  private
    
    def route_params
      params.require(:route).permit(:name, :color, :difficulty, :description)
    end
end
