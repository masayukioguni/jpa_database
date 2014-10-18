
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
    lifter = AdminUtil.lifter(hash)     
    championship = AdminUtil.championship(hash)

    next if AdminUtil.exist?(model,lifter.id,championship.id)
    
    weight_category =  AdminUtil.weight_category(hash)
    class_category = AdminUtil.class_category(hash)

    first_sq_record =  AdminUtil.record(hash[:squat_first])
    second_sq_record = AdminUtil.record(hash[:squat_second])
    third_sq_record = AdminUtil.record(hash[:squat_third])
    
    first_bp_record = AdminUtil.record(hash[:benchpress_first])
    second_bp_record = AdminUtil.record(hash[:benchpress_second])
    third_bp_record = AdminUtil.record(hash[:benchpress_third])

    first_dl_record = AdminUtil.record(hash[:deadlift_first])
    second_dl_record = AdminUtil.record(hash[:deadlift_second])
    third_dl_record = AdminUtil.record(hash[:deadlift_third])

    sq_result = AdminUtil.result(first_sq_record,second_sq_record,third_sq_record)
    bp_result = AdminUtil.result(first_bp_record,second_bp_record,third_bp_record)
    dl_result = AdminUtil.result(first_dl_record,second_dl_record,third_dl_record)

    result = sq_result + bp_result + dl_result

    is_disqualified = AdminUtil.disqualified?(result)

    weight = AdminUtil.record(hash[:weight])
    formula = AdminUtil.formula(lifter.gender,weight,result)

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
                 use_gear: AdminUtil.use_gear?(hash[:use_gear]),
                 is_disqualified: is_disqualified)
  end

end
