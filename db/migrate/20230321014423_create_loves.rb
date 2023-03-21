class CreateLoves < ActiveRecord::Migration[7.0]
  def change
    create_table :loves do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
