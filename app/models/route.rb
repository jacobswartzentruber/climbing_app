class Route < ActiveRecord::Base
  belongs_to :gym
  has_many :projects, dependent: :destroy
  has_many :climbers, through: :projects
  
  validates_presence_of :gym_id
  validates :color, presence: true
  validates :difficulty, presence: true
  validates :description, length: {maximum: 140}


  #Returns status of project
  def project_status(user, logged_in)
  	if logged_in && user.profile_type == "Climber"
	    if self.climbers.include?(user.profile)
	      if self.projects.find_by(climber_id: user.profile.id).completed
	        return "completed"
	      else
	        return "uncompleted"
	      end
	    end
	    return "not-project"
	  end
  end

end
