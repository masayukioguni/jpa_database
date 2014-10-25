ActiveAdmin.register Benchpress do
  permit_params :lifter_id, :weight, :class_category_id, :wieght_category_id,
                :championship_id, :first, :second, :third, :use_gear, :formula,
                :is_disqualified, :rank

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
    column :rank
    column :formula
    column :championship
    column :use_gear
    column :is_disqualified
    actions
  end

  active_admin_importable do |model, hash|
    lifter = AdminUtil.lifter(hash[:name], hash[:gender])
    championship = AdminUtil.championship(hash[:championship_name])

    next if AdminUtil.exist?(model, lifter.id, championship.id)

    weight_category =  AdminUtil.weight_category(hash[:weight_category_name])
    class_category = AdminUtil.class_category(hash[:class_category_name])

    first_record =  AdminUtil.record(hash[:first])
    second_record = AdminUtil.record(hash[:second])
    third_record = AdminUtil.record(hash[:third])

    result = AdminUtil.result(first_record, second_record, third_record)

    is_disqualified = AdminUtil.disqualified?(result)

    weight = AdminUtil.record(hash[:weight])

    formula = AdminUtil.formula(lifter.gender, weight, result)

    model.create(lifter_id: lifter.id,
                 championship_id: championship.id,
                 class_category_id: class_category.id,
                 weight_category_id: weight_category.id,
                 weight: weight,
                 first: first_record,
                 second: second_record,
                 third: third_record,
                 result: result,
                 formula: formula,
                 use_gear: AdminUtil.use_gear?(hash[:use_gear]),
                 rank: AdminUtil.rank(hash[:rank]),
                 is_disqualified: is_disqualified)
  end
end
