class Project < ActiveRecord::Base
	belongs_to :climber
	belongs_to :route
	validates :climber_id, presence: true
	validates :route_id, presence: true
end
