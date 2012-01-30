require 'fileutils'
task :push_scores => :environment do
  files = Dir.glob("tmp/users/*")
  files.each do |path|
    match = /users\/(.*)_(.)/.match(path)
    world_id = World.where(:lang => match[1], :front => match[2]).first.id
    puts "Processing world #{match[1]}_#{match[2]} [id: #{world_id}]"
    file = File.open(path)
    lines = file.readlines()
    player_ids = []
    players = {}
    1200.times {|i| player_ids << lines[i*4].to_i; players[lines[i*4].to_i] = lines[i*4+1].strip}
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
    Player.where(:game_player_id => player_ids, :world_id => 1).each do |player|
      players[player.game_player_id] = player.id
    end
  
  
    1200.times do |i|
      Score.create(:score => lines[i*4+3], :place => lines[i*4+2], :player_id => players[lines[i*4].to_i])
    end
    
    FileUtils.rm(path)
  end
  
end