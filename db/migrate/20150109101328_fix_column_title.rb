class FixColumnTitle < ActiveRecord::Migration
  def change
  	rename_column :events, :title, :title_no
  end
end
