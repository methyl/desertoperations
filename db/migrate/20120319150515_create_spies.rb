class CreateSpies < ActiveRecord::Migration
  def change
    create_table :spies do |t|
      t.integer :player_id
      t.integer :user_id
      t.integer :bank_level
      t.integer :score_id

      t.timestamps
    end
  end
end
