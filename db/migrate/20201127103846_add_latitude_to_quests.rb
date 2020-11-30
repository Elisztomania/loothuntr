class AddLatitudeToQuests < ActiveRecord::Migration[6.0]
  def change
    add_column :quests, :latitude, :float
  end
end
