class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :invitation
  belongs_to :register_invitation, :class_name => "Invitation"
  has_many :spies
  has_many :reminds

  attr_accessible :username, :email, :password, :password_confirmation, :register_invitation_id

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :register_invitation
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validate :invitation_cannot_be_expired

  def invitation_cannot_be_expired
    if register_invitation.nil? or register_invitation.expired?
      errors.add(:register_invitation_id, "is invalid")
    end
  end

  def generate_invitation
    invitation.destroy unless invitation.nil?
    self.create_invitation
  end
  
end
