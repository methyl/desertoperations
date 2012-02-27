class World < ActiveRecord::Base
  has_many :players
  has_many :scores
  belongs_to :language
  
  def level_factor
    (level_summary.to_f / bank_count.to_f).round(2) unless bank_count == 0
  end
  
  def recalculate_stats
    players_with_bank_level = players.with_bank_level
    sum = 0
    players_with_bank_level.each {|p| sum += p.bank_level}
    self.update_attributes :bank_count => players_with_bank_level.count, :level_summary => sum
  end
end
