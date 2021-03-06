class Gym < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy, inverse_of: :profile
  accepts_nested_attributes_for :user
  has_many :routes, dependent: :destroy
end