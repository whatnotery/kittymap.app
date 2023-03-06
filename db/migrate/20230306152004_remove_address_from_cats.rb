class RemoveAddressFromCats < ActiveRecord::Migration[7.0]
  def change
    remove_column :cats, :address, :string
  end
end
