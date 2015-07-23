class ChangeDatetimeToDateInConcerts < ActiveRecord::Migration
  def change
    change_column :concerts, :date, :date
  end
end
