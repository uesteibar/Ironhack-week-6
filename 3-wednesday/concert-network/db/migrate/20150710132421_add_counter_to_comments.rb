class AddCounterToComments < ActiveRecord::Migration
  def change
    add_column :concerts, :comments_count, :integer, default: 0
  end
end
