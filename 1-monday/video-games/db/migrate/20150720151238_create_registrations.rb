class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :tournaments
      t.references :users

      t.timestamps null: false
    end
  end
end
