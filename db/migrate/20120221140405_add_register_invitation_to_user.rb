class AddRegisterInvitationToUser < ActiveRecord::Migration
  def change
    add_column :users, :register_invitation_id, :string

  end
end
