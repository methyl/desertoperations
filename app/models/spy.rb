class Spy < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :player
  belongs_to :score
  
  scope :completed, where("bank_level is not null")
  
  def ready?
    (Time.now - created_at) > 10.seconds
  end

  def completed?
    !bank_level.nil?
  end
  
  def toggle_remind
    update_attribute :remind, !remind
  end
  
end
