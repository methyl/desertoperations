class CreateWorldStats < ActiveRecord::Migration
  def change
    create_table :world_stats do |t|
      t.integer :world_id
      t.integer :level_summary
      t.integer :bank_count

      t.timestamps
    end
  end
end
