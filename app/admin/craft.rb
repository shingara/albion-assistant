# frozen_string_literal: true

ActiveAdmin.register Craft do

  permit_params :item_id, :focalisation,
    craft_items_attributes: [:id, :item_id, :quantity, :_destroy]

  form do |f|
    f.inputs do
      f.input :item, as: :select, collection: Item.all.collect { |item| [item.to_s, item.id] }
      f.input :focalisation
    end

    f.inputs do
      f.has_many :craft_items do |craft_it_f|
        craft_it_f.input :item, as: :select, collection: Item.all.collect { |item| [item.to_s, item.id] }
        craft_it_f.input :quantity
      end
    end
    actions
  end

  show do
    attributes_table_for craft do
      row :item
      row :tier do
        craft.item.tier
      end
      row :focalisation
    end

    table_for craft.craft_items do
      column :name do |ci|
        ci.item.global_name
      end
      column :tier do |ci|
        ci.item.tier
      end
      column :quantity
    end
  end
end
