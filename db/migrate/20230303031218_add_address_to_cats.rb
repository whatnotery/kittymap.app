class AddAddressToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :address, :string
  end
end
