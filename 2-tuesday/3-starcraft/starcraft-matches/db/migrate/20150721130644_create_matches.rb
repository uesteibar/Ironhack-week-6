class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer   :duration
      t.datetime  :date

      t.timestamps null: false
    end

    add_reference :matches, :winner,  references: :users
    add_reference :matches, :loser,   references: :users
  end
end
