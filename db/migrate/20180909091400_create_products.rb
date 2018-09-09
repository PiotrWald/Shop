# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :count
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
