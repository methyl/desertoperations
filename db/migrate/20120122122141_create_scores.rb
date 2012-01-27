class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :place
      t.integer :player_id

      t.timestamps
    end
  end
end
