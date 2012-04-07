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
  
  def no_level_since(conditions=[])
    last_score = 0
    level = nil
    (Condition.all.each {|cond| conditions << cond.value}) if conditions.empty?
    self.scores.each do |score|
      level = score.created_at if (score.score-last_score).in? conditions
      last_score = score.score
    end
    
    return level
    
  end

end
