class FixColumnBody < ActiveRecord::Migration
  def change
  	rename_column :events, :body, :body_no
  end
end
