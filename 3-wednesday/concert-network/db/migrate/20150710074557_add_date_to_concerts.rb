class AddDateToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :date, :datetime
  end
end
