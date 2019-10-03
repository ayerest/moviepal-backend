class Notification < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.boolean :turned_on

      t.timestamps
    end
  end
end
