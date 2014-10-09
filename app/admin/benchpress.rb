ActiveAdmin.register Benchpress do
  permit_params :lifter_id, :weight, :class_category_id, :wieght_category_id,:championship_id, :first, :second, :third
  
  index do
    selectable_column
    id_column
    column :lifter
    column :weight
    column :class_category
    column :weight_category
    column :first
    column :second
    column :third
    column :championship
    column :use_gear
    column :is_disqualified
    actions
  end

  active_admin_importable do |model, hash|
    p hash
  end 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
