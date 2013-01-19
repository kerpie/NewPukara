class Notification < ActiveRecord::Base
  attr_accessible :local_id, :message, :user_id
end
