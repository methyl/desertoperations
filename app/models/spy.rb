class Spy < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :player
  belongs_to :score
  
  def ready?
    (Time.now - created_at) > 10.seconds
  end

end
