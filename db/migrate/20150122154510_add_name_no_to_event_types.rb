class AddNameNoToEventTypes < ActiveRecord::Migration
  def change
    add_column :event_types, :name_no, :string
    rename_column :event_types, :name, :name_en
  end
end
