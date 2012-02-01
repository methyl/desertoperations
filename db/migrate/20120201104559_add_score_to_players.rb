class AddScoreToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :score, :integer

  end
end
