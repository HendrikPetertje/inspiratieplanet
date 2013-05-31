class Page < ActiveRecord::Base
   attr_accessible :about, :privacy, :contact, :user_id
end
