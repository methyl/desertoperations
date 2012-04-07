class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :invitation
  belongs_to :default_front, :class_name => "World"
  belongs_to :default_language, :class_name => "Language"
  belongs_to :register_invitation, :class_name => "Invitation"
  has_many :spies
  has_many :reminds
  has_and_belongs_to_many :languages

  attr_accessible :username, :email, :password, :password_confirmation, :register_invitation_id, :default_language_id, :default_front_id

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :register_invitation
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validate :invitation_cannot_be_expired, :on => :create
  
  scope :notified, where("notify_to >= ?", Date.today)

  def invitation_cannot_be_expired
    if register_invitation.nil? or register_invitation.expired?
      errors.add(:register_invitation_id, "is invalid")
    end
  end

  def generate_invitation
    invitation.destroy unless invitation.nil?
    self.create_invitation
  end
  
  
  def update_balance(amount)
    balance >= amount ? update_attribute(:balance, balance-amount) : false
  end
  
end
