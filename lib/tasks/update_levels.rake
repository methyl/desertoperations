task :update_levels => :environment do
  players = Player.includes(:scores)
  conditions = {}
  Condition.all.each do |condition|
    conditions[condition.value] = condition.level
  end
  ActiveRecord::Base.transaction do
    players.each do |player|
      next if player.scores.size < 2
      score = player.scores.last.score
      last_score = player.scores[-2].score
      # player.update_attributes(:score => score, :last_score => last_score)
      
      last_score = player.scores.first.score
      player.scores.each do |score|
        bank_level = conditions[score.score-last_score]
        player.update_attributes(:bank_level => bank_level) if bank_level
        last_score = score.score
      end
      
    end
  end
end