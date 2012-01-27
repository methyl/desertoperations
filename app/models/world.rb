class World < ActiveRecord::Base
  has_many :players
  has_many :scores
end
