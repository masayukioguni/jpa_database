ActiveAdmin.register Championship do


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

  active_admin_importable do |model, hash|
    model.create(name: hash[:name], 
                 start_at: hash[:start_at],
                 end_at: hash[:end_at],
                 place: hash[:place],
                 is_breakable_japanese_record: hash[:is_breakable_japanese_record])
  end


end
