class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.integer :game_player_id
      t.integer :world_id

      t.timestamps
    end
  end
end
