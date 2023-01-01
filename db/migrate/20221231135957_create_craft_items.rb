class CreateCraftItems < ActiveRecord::Migration[7.0]
  def change
    create_table :craft_items do |t|

      t.belongs_to :craft
      t.belongs_to :item
      t.integer :quantity

      t.timestamps
    end
  end
end
