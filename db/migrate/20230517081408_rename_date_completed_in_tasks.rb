class RenameDateCompletedInTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :dateCompleted, :date_completed
  end
end
