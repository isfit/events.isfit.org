class AddColumnBodyEnToTableEventsAfterBodyeNo < ActiveRecord::Migration
  def change
  	add_column :events, :body_en, :string, after: :body_no
  end
end
