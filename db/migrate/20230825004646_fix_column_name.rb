class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :alias, :name
  end
end
