# frozen_string_literal: true

ActiveAdmin.register Item do

  permit_params :name, :tier, :level,
    prices_attributes: [:id, :market_id, :value, :_destroy],
    craft_attributes: [
      :id, :focalisation, :_destroy,
      {craft_items_attributes: [:id, :item_id, :quantity, :_destroy]}
    ]

  show do
    attributes_table_for item do
      row :name
      row :tier
      row :level
    end

    table_for item.prices do
      column :market do |price|
        price.market.name
      end
      column :prix do |price|
        price.value
      end
    end

    if item.craft

      table_for item.craft.craft_items do
        column :name do |ci|
          ci.item.global_name
        end
        column :tier do |ci|
          ci.item.tier
        end
        column :quantity
      end

      table_for item.craft.craft_prices do
        column :market
        column :craft_price
        column :sell_price
        column :focalisation
        column :benefice
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :tier
      f.input :level
    end

    f.inputs do
      f.has_many :prices do |prices_f|
        prices_f.input :market, as: :select, collection: Market.all.collect { |market| [market.name, market.id] }
        prices_f.input :value
      end
    end

    f.inputs do
      f.has_many :craft do |craft_f|
        craft_f.input :focalisation

        craft_f.has_many :craft_items do |craft_it_f|
          craft_it_f.input :item, as: :select, collection: Item.all.collect { |item| [item.to_s, item.id] }
          craft_it_f.input :quantity
        end
      end
    end

    actions
  end

end
