class Invitation < ActiveRecord::Base
  set_primary_key :id #workaround for setting string as id

  belongs_to :user
  has_many :registered_users, :class_name => "User", :foreign_key => :register_invitation_id

  before_create :generate_id

  def expired?
    return false if ((Time.now - self.created_at)/1.day).round < 7
    true
  end

  private

  def generate_id(size = 12)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    while true
      self.id = (0...size).map{ charset.to_a[rand(charset.size)] }.join
      break if self.valid?
    end 
  end
  

end
