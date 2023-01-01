class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.integer :value
      t.belongs_to :market
      t.belongs_to :item

      t.timestamps
    end
  end
end
