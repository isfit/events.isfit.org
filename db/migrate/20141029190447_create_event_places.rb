class CreateEventPlaces < ActiveRecord::Migration
  def change
    create_table :event_places do |t|

      t.timestamps
    end
  end
end
