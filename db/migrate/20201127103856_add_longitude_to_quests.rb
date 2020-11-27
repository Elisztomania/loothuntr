class AddLongitudeToQuests < ActiveRecord::Migration[6.0]
  def change
    add_column :quests, :longitude, :float
  end
end
