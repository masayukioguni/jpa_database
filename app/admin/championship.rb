ActiveAdmin.register Championship do
  permit_params :name, :start_at, :end_at, :place, :is_breakable_japanese_record
  active_admin_importable do |model, hash|
    model.create(name: hash[:name],
                 start_at: hash[:start_at],
                 end_at: hash[:end_at],
                 place: hash[:place],
                 is_breakable_japanese_record: hash[:is_breakable_japanese_record])
  end
end
