class InvitationsController < ApplicationController
  def create
    current_user.generate_invitation
    redirect_to :root, :notice => "Invitation has been generated successfuly"
  end
end
