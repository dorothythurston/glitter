class CreateGlitterings < ActiveRecord::Migration
  def change
    create_table :glitterings do |t|
      t.belongs_to :glitterable, polymorphic: true, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
