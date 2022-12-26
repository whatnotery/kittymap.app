class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :alias
      t.text :description
      t.string :latitude
      t.string :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
