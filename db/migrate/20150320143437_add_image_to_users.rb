class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, default: 'http://robohash.org/occaecatiquonisi.png?size=300x300'
  end
end
