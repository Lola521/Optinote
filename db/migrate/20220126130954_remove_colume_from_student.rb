class RemoveColumeFromStudent < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :user_id
    add_reference :students, :user, index: true
  end
end
