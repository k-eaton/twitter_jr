class Tweet < ActiveRecord::Base
  belongs_to :user

  has_many   :favorites
  has_many   :favorite_users, :through => :favorites

  validates :content, presence: true
  validates :content, length: { maximum: 138 }
end
