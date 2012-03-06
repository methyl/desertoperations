class WorldStat < ActiveRecord::Base
  belongs_to :world
  
  #def self.bank_count
  #  sum = 0
  #  World.all.each {|w| sum += w.bank_count}
  #  sum
  #end
  
  before_create :round_created_at
  
  def round_created_at
    seconds = 3.hours
    time = Time.at((self.created_at.to_f / seconds).round * seconds)
    self.created_at = time
  end
  
end
