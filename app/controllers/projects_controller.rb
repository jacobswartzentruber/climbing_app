class ProjectsController < ApplicationController
	before_action :logged_in_user

  def create
    route = Route.find(params[:route_id])
    climber = current_user.profile
    climber.add_project(route)
    flash[:success] = "Route added as project"
    redirect_to route.gym
  end

  def destroy
    route = Project.find(params[:id]).route
    climber = current_user.profile
    climber.remove_project(route)
    flash[:success] = "Route removed from projects"
    redirect_to climber
  end

  def complete
    project = Project.find(params[:id])
    project.update_attribute(:completed, true)
    flash[:success] = "Route completed"
    redirect_to current_user.profile
  end
end
