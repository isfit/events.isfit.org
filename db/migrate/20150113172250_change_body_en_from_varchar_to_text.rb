class ChangeBodyEnFromVarcharToText < ActiveRecord::Migration
  def change
  	change_column :events, :body_en, :text
  end
end
