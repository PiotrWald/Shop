class CreateInvoiceProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_products do |t|
      t.integer :price
      t.belongs_to :product, index: true
      t.belongs_to :invoice, index: true
      t.timestamps
    end
  end
end
