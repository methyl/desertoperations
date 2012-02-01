class AddLastScoreAndBankLevelToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :last_score, :integer

    add_column :players, :bank_level, :integer

  end
end
