class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
      t.references :child_task, foreign_key: { to_table: :tasks }

      t.timestamps
      
      t.index [:task_id, :child_task_id], unique: true
    end
  end
end
