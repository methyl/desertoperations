require 'fileutils'
task :push_scores => :environment do
  files = Dir.glob("tmp/users/*")
  players_count = 3000
  files.each do |path|
    match = /users\/(.*)_(.)/.match(path)
    world = World.where(:language_id => match[1], :front => match[2]).first
    world_id = world.id
    puts "Processing world #{match[1]}_#{match[2]} [id: #{world_id}]"
    file = File.open(path)
    lines = file.readlines()
    next if lines.size != players_count*4
    player_ids = []
    players = {}
    players_count.times {|i| player_ids << lines[i*4].to_i; players[lines[i*4].to_i] = lines[i*4+1].strip}
    existing_player_ids = []
    existing_players = Player.where(:game_player_id => player_ids, :world_id => world_id)
    existing_players.each {|player| existing_player_ids << player.game_player_id}
    not_existing_player_ids = player_ids - existing_player_ids
    ActiveRecord::Base.transaction do
      not_existing_player_ids.each do |id|
        Player.create(:game_player_id => id, :player_name => players[id], :world_id => world_id)
      end
    end
  
    players = {}
    Player.where(:game_player_id => player_ids, :world_id => world_id).each do |player|
      players[player.game_player_id] = player
    end
    
    conditions = {}
    Condition.all.each do |condition|
      conditions[condition.value] = condition.level
    end
    
    ActiveRecord::Base.transaction do
      players_count.times do |i|
        player = players[lines[i*4].to_i]
        player_name = lines[i*4+1].strip
        score = lines[i*4+3].to_i
        place = lines[i*4+2]
        player.scores.create(:score => score, :place => place)
        
        unless (player.score && player.last_score)
          player.update_attributes(:score => score, :last_score => score)
          next
        end
        
        last_score = player.score
        bank_level = conditions[score-last_score]
        attrs = {:score => score, :last_score => last_score, :player_name => player_name}
        (attrs[:bank_level] = bank_level) if bank_level
        player.update_attributes(attrs)
      end
    end
    
    world.recalculate_stats
    
    FileUtils.rm(path)
  end
  
end