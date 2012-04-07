class AddNotifyToToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notify_to, :date

  end
end
