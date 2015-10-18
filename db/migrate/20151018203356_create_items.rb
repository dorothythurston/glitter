class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.string :text
      t.timestamps null: false
    end
  end
end
