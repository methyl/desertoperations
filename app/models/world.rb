class World < ActiveRecord::Base
  has_many :players
  has_many :scores
  has_many :world_stats
  belongs_to :language
  
  def level_factor
    (level_summary.to_f / bank_count.to_f).round(2) unless bank_count == 0
  end
  
  def recalculate_stats
    players_with_bank_level = players.with_bank_level
    sum = 0
    players_with_bank_level.each {|p| sum += p.bank_level}
    self.update_attributes :bank_count => players_with_bank_level.count, :level_summary => sum
    self.world_stats.create :bank_count => players_with_bank_level.count, :level_summary => sum
  end
  
  def chart
    bank = self.world_stats.where("created_at > ?", DateTime.now-14.days).group('Date(created_at)').sum(:bank_count)
    bank_growth = bank.values.each_with_index.map {|k, i| k -= bank.values[i-1]}
    return LazyHighCharts::HighChart.new('graph', :class=>"chart") do |f|
      f.xAxis(:categories => bank.keys.map {|k| k.strftime("%d-%m")})
      f.series(:name => "Bank count", :data => bank.values)
      #f.series(:name => "Growth", :data => [bank_growth[1]] + bank_growth[1..-1]) #assuming first growth
      f.chart(:width => 800)
    end
    
  end
  

end
