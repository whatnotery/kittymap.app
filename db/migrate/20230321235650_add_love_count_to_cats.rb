class AddLoveCountToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :love_count, :integer, null: false, default: 0
  end
end
