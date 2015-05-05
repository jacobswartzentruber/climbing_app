class Route < ActiveRecord::Base
  belongs_to :gym
  has_many :projects, dependent: :destroy
  has_many :climbers, through: :projects
  
  validates_presence_of :gym_id
  validates :color, presence: true
  validates :difficulty, presence: true
  validates :description, length: {maximum: 140}
end
