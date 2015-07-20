class CreateRegistration < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references  :tournament
      t.references  :user

      t.timestamps null: false
    end
  end
end
