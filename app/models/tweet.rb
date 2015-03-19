class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { maximum: 138 }
end
