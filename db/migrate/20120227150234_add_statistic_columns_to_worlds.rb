class AddStatisticColumnsToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :level_summary, :integer

    add_column :worlds, :bank_count, :integer

  end
end
