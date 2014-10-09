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
    column :result
    column :championship
    column :use_gear
    column :is_disqualified
    actions
  end

  active_admin_importable do |model, hash|
    lifter =  Lifter.select(:id).where('name LIKE ?', "%#{hash[:name]}%").first
    championship =  Championship.select(:id).where('name LIKE ?', "%#{hash[:championship_name]}%").first
    weight_category =  WeightCategory.select(:id).where('name LIKE ?', "%#{hash[:weight_category_name]}%").first
    class_category =  ClassCategory.select(:id).where('name LIKE ?', "%#{hash[:class_category_name]}%").first
    first_record =  hash[:first].nil? ?  0 : hash[:first].to_f
    second_record = hash[:second].nil? ?  0 : hash[:second].to_f
    third_record = hash[:third].nil? ?  0 : hash[:third].to_f
    
    result = [first_record,second_record,third_record,0].max
    is_disqualified = result == 0 ? true : false

    model.create(lifter_id: lifter.id, 
                 championship_id: championship.id,
                 class_category_id: class_category.id,
                 weight_category_id: weight_category.id,
                 weight: hash[:weight],
                 first: hash[:first],
                 second: hash[:second],
                 third: hash[:third],
                 result: result,
                 use_gear:hash[:use_gear],
                 is_disqualified: is_disqualified)
  end
end
