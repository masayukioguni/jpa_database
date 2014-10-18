def record(value)
  value.nil? ?  0 : value.to_f 
end

ActiveAdmin.register Powerlifting do
  permit_params :lifter_id, :weight, :class_category_id, :wieght_category_id,
                :championship_id, :first, :second, :third, :use_gear, :formula,
                :is_disqualified
  
  index do
    selectable_column
    id_column
    column :lifter
    column :weight
    column :class_category
    column :weight_category
    column :squat_first
    column :squat_second
    column :squat_third
    column :benchpress_first
    column :benchpress_second
    column :benchpress_third
    column :deadlift_first
    column :deadlift_second
    column :deadlift_third
    column :result
    column :formula
    column :championship
    column :use_gear
    column :is_disqualified
    actions
  end

  active_admin_importable do |model, hash|
    lifter = Lifter.select(:id).where('name LIKE ?', "%#{hash[:name]}%").first
    lifter = Lifter.create(name: hash[:name].force_encoding("utf-8"),
                           name_kana: "test",
                           gender: hash[:gender].force_encoding("utf-8")) if lifter.blank?
    
    championship =  Championship.select(:id).where('name LIKE ?', "%#{hash[:championship_name]}%").first
    championship = Championship.create(name: hash[:championship_name].force_encoding("utf-8")) if championship.blank? 
    
    weight_category =  WeightCategory.select(:id).where('name LIKE ?', "%#{hash[:weight_category_name]}%").first
    weight_category = WeightCategory.create(name: hash[:weight_category_name].force_encoding("utf-8")) if weight_category.blank? 

    class_category =  ClassCategory.select(:id).where('name LIKE ?', "%#{hash[:class_category_name]}%").first
    class_category = ClassCategory.create(name: hash[:class_category_name].force_encoding("utf-8")) if class_category.blank?

    count = model.where('lifter_id = ? AND championship_id = ? AND weight_category_id = ? AND class_category_id = ?',
                        lifter.id,championship.id,weight_category.id,class_category.id).count
    next unless count == 0

    
    first_sq_record =  record(hash[:squat_first])
    second_sq_record = record(hash[:squat_second])
    third_sq_record = record(hash[:squat_third])
    
    first_bp_record =  record(hash[:benchpress_first])
    second_bp_record = record(hash[:benchpress_second])
    third_bp_record = record(hash[:benchpress_third])

    first_dl_record =  record(hash[:deadlift_first])
    second_dl_record = record(hash[:deadlift_second])
    third_dl_record = record(hash[:deadlift_third])

    sq_result = [first_sq_record,second_sq_record,third_sq_record,0].max
    bp_result = [first_bp_record,second_bp_record,third_bp_record,0].max
    dl_result = [first_dl_record,second_dl_record,third_dl_record,0].max

    result = sq_result + bp_result + dl_result

    is_disqualified = result == 0 ? true : false

    formula = 0.0
    weight = hash[:weight].nil? ?  0 : hash[:weight].to_f
    if lifter.gender == 'male'
      formula = Wilksformula.men_formula(weight,result)
    else
      formula = Wilksformula.women_formula(weight,result)
    end

    model.create(lifter_id: lifter.id, 
                 championship_id: championship.id,
                 class_category_id: class_category.id,
                 weight_category_id: weight_category.id,
                 weight: weight,
                 squat_first: first_sq_record,
                 squat_second: second_sq_record,
                 squat_third: third_sq_record,
                 benchpress_first: first_bp_record,
                 benchpress_second: second_bp_record,
                 benchpress_third: third_bp_record,
                 deadlift_first: first_dl_record,
                 deadlift_second: second_dl_record,
                 deadlift_third: third_dl_record,
                 result: result,
                 formula: formula,
                 use_gear: hash[:use_gear],
                 is_disqualified: is_disqualified)
  end

end
