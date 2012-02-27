class Player < ActiveRecord::Base
  has_many :scores
  belongs_to :world
  
  scope :with_bank_level, where('bank_level is not null')
end
