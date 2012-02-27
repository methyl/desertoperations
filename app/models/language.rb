class Language < ActiveRecord::Base
  set_primary_key :name
  has_many :worlds 
end
