class AddDefaultFrontToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_front_id, :integer

  end
end
