class ChangeListTaskAssociation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :list
    add_reference :tasks, :list, index: true, foreign_key: true, null: true
  end
end
