class AddSlugToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :slug, :string
    add_index :cats, :slug, unique: true
  end
end
