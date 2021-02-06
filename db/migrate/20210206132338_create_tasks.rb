class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.references :status, foreign_key: true
      t.references :priority, foreign_key: true
      t.date :start
      t.date :deadline

      t.timestamps
    end
  end
end
