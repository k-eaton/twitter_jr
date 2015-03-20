class Tweet < ActiveRecord::Base
  belongs_to :user

  has_many   :favorites
  has_many   :favorite_users, :through => :favorites

  validates :content, presence: true
  validates :content, length: { maximum: 138 }

   def toggle_favorite(input_user)
    if Tweet.where(id: self.id).first.favorites.empty?
       Favorite.create(tweet_id: self.id, user_id: input_user.id)
    else
      Favorite.where(tweet_id: self.id, user_id:input_user.id).first.destroy
    end 
  end 
end
