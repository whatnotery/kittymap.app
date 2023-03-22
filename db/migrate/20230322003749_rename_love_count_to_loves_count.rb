class RenameLoveCountToLovesCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :love_count, :loves_count
  end

end
