class Route < ActiveRecord::Base
  belongs_to :gym, dependent: :destroy
end
