class Language < ActiveRecord::Base
  set_primary_key :name
  has_many :worlds
  has_and_belongs_to_many :users 
end
