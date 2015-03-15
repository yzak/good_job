class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :name
      t.string :message
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end
