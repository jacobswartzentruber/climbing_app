class Gym < ActiveRecord::Base
  has_one :user, foreign_key: "profile_id", dependent: :destroy
  accepts_nested_attributes_for :user
end
