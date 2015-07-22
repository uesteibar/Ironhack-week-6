class ChangeFromCitynameToCityModelOnConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :city_id, :integer
    remove_column :concerts, :city
  end
end
