class AddNotNullConstraintToTaskName < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :name, :string, null: false
  end
end
