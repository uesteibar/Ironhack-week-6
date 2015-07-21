class AddFactionsToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :winner_faction, references: :factions
    add_reference :matches, :loser_faction, references: :factions

    change_column :matches, :winner_id, :integer, null: false
    change_column :matches, :loser_id, :integer, null: false
  end
end
