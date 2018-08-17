class AddColumnToBasicHeroscope < ActiveRecord::Migration
  def change
    add_column :basic_heroscopes, :user_id, :integer
  end
end
