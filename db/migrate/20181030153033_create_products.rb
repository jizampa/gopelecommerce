class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.text :description
      t.float :price
      t.integer :stock
      t.string :image
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
