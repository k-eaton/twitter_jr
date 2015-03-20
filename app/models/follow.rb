class Follow < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :foreign_key => "user_id"
  belongs_to :followee, :class_name => "User", :foreign_key => "subscribed_to_id"






end
