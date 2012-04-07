class Spy < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :player
  belongs_to :score
  
  scope :completed, where("bank_level is not null")
  
  validate :user_balance_must_be_enough, :on => :create
  
  before_create :update_user_balance
  
  def ready?
    (Time.now - created_at) > 10.seconds
  end

  def completed?
    !bank_level.nil?
  end
  
  def toggle_remind
    update_attribute :remind, !remind
  end
  
  def user_balance_must_be_enough
    self.errors.add(:user, "not enough balance") if user.balance < Settings.spy_cost
  end
  
  def update_user_balance
    user.update_balance(Settings.spy_cost)
  end
  
end
