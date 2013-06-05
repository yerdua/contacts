class ChangeFavoritesUserIdToOwnerId < ActiveRecord::Migration
  def change
    change_table :favorites do |t|
      t.rename :user_id, :owner_id
    end
  end
end
