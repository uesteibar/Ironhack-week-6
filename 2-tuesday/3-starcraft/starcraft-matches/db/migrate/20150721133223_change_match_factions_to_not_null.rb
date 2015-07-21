class ChangeMatchFactionsToNotNull < ActiveRecord::Migration
  def change
    change_column :matches, :winner_faction_id, :integer, null: false
    change_column :matches, :loser_faction_id, :integer, null: false
  end
end
