class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.text :cover_letter
      t.boolean :accepted, default: false
      t.references :user, null: false, foreign_key: true
      t.references :guild, null: false, foreign_key: true

      t.timestamps
    end
  end
end
