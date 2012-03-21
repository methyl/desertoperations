class Player < ActiveRecord::Base
  has_many :scores
  has_many :spies
  belongs_to :world
  
  scope :with_bank_level, where('bank_level is not null')
  
  def place
    scores.last.nil? ? -1 : scores.last.place
  end

  def available?
    not bank_level.nil?
  end
  
end
