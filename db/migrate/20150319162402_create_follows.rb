class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :subscribed_to_id
      t.timestamps
    end
  end
end
