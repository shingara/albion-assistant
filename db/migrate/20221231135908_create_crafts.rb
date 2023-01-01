class CreateCrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :crafts do |t|

      t.belongs_to :item
      t.timestamps
    end
  end
end
