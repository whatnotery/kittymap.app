class RemoveLovesCountFromCats < ActiveRecord::Migration[7.0]
  def change
    remove_column :cats, :loves_count, :integer
  end
end
