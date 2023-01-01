class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :tier
      t.integer :level

      t.timestamps
    end
  end
end
