class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|

      t.timestamps
    end
  end
end
