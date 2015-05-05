class Climber < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy, inverse_of: :profile
  accepts_nested_attributes_for :user
  has_many :projects, dependent: :destroy
  has_many :routes, through: :projects do 
    def completed
      where("projects.completed = (?)", true)
    end
    def uncompleted
      where("projects.completed = (?)", false)
    end
  end

  #Add a project
  def add_project(project_route)
  	self.projects.create(route_id: project_route.id)
  end

  #Remove a project
  def remove_project(project_route)
  	self.projects.find_by(route_id: project_route.id).destroy
  end

  #Returns true if climber is working on this project
  def working_on?(project_route)
  	self.routes.include?(project_route)
  end

  #Complete a project
  def completed_project?(project_route)
    self.projects.find_by(route_id: project_route.id).completed
  end
end
