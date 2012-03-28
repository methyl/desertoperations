class CreateReminds < ActiveRecord::Migration
  def change
    create_table :reminds do |t|
      t.integer :user_id
      t.integer :player_id

      t.timestamps
    end
  end
end
