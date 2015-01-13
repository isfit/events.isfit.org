class AddColumnTitleEnToTableEventsAfterTitleNo < ActiveRecord::Migration
  def change
  	add_column :events, :title_en, :string, after: :title_no
  end
end
