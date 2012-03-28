class Remind < ActiveRecord::Base
  belongs_to :user
  belongs_to :player
  
  validates_uniqueness_of :player_id, :scope => :user_id
end
