class CreateUserWithIndices < ActiveRecord::Migration
  def change
    create_table :user_with_indices do |t|
      t.string :name

      t.timestamps null: false
    end

    add_index :user_with_indices, [:name]
  end
end
