class CreateProdcutPriceHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :prodcut_price_histories do |t|
      t.decimal :price
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
