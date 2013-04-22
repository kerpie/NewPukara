class Notification < ActiveRecord::Base
  attr_accessible :local_id, :message, :user_id

  belongs_to :user 
end
