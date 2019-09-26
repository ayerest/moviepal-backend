class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.boolean :unlike
      t.boolean :to_watch

      t.timestamps
    end
  end
end
