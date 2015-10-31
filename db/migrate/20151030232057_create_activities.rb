class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user, index: true
      t.string :type
      t.belongs_to :subject, index: true, polymorphic: true
      t.integer :actor_id, index: true
      t.integer :target_id, index: true
      t.string :target_type, index: true

      t.timestamps
    end
  end
end
