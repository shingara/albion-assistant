# frozen_string_literal: true

ActiveAdmin.register Craft do

  permit_params :item_id,
    craft_items_attributes: [:id, :item_id, :quantity, :_destroy]

  form do |f|
    f.inputs do
      f.input :item, as: :select, collection: Item.all.collect { |item| [item.to_s, item.id] }
    end

    f.inputs do
      f.has_many :craft_items do |craft_it_f|
          # if !craft_it_f.object.nil?
          #   # show the destroy checkbox only if it is an existing appointment
          #   # else, there's already dynamic JS to add / remove new appointments
          #   craft_it_f.input :_destroy, :as => :boolean, :label => "Destroy?"
          # end
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
