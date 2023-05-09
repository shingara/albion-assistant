class AddFocalisationCraft < ActiveRecord::Migration[7.0]
  def change
    add_column :crafts, :focalisation, :float
  end
end
