class AddNullFalseToActivities < ActiveRecord::Migration
  def change
    change_column :activities, :user_id, :integer, null: false
    change_column :activities, :type, :string, null: false
    change_column :activities, :subject_id, :integer, null: false
    change_column :activities, :subject_type, :string, null: false
    change_column :activities, :actor_id, :integer, null: false
    change_column :activities, :target_id, :integer,  null: false
    change_column :activities, :target_type, :string, null: false
    change_column :activities, :created_at, :datetime, null: false
    change_column :activities, :updated_at, :datetime,null: false
  end
end
