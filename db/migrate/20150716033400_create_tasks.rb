class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :duration
      t.references :parent

      t.timestamps null: false
    end
  end
end
