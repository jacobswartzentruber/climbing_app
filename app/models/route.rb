class Route < ActiveRecord::Base
  belongs_to :gym
  
  validates_presence_of :gym_id
  validates :color, presence: true
  validates :difficulty, presence: true
  validates :description, length: {maximum: 140}
end
