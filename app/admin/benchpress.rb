ActiveAdmin.register Benchpress do
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
    column :first
    column :second
    column :third
    column :result
    column :formula
    
    column :championship
    column :use_gear
    column :is_disqualified
    actions
  end

  active_admin_importable do |model, hash|
    lifter = Lifter.select(:id).where('name LIKE ?', "%#{hash[:name]}%").first
    lifter = Lifter.create(name: hash[:name],name_kana: "test") if lifter.blank?
    
    championship =  Championship.select(:id).where('name LIKE ?', "%#{hash[:championship_name]}%").first
    championship = Championship.create(name: hash[:championship_name]) if championship.blank? 
    
    weight_category =  WeightCategory.select(:id).where('name LIKE ?', "%#{hash[:weight_category_name]}%").first
    weight_category = WeightCategory.create(name: hash[:weight_category_name]) if weight_category.blank? 

    class_category =  ClassCategory.select(:id).where('name LIKE ?', "%#{hash[:class_category_name]}%").first
    class_category = ClassCategory.create(name: hash[:class_category_name]) if class_category.blank?

    count = model.where('lifter_id = ? AND championship_id = ? AND weight_category_id = ? AND class_category_id = ?',
                        lifter.id,championship.id,weight_category.id,class_category.id).count
    next unless count == 0

    first_record =  hash[:first].nil? ?  0 : hash[:first].to_f
    second_record = hash[:second].nil? ?  0 : hash[:second].to_f
    third_record = hash[:third].nil? ?  0 : hash[:third].to_f
    
    result = [first_record,second_record,third_record,0].max
    is_disqualified = result == 0 ? true : false

    formula = 0.0
    weight = hash[:weight].nil? ?  0 : hash[:weight].to_f
    if hash[:gender] == 'male'
      formula = Wilksformula.men_formula(weight,result)
    else
      formula = Wilksformula.women_formula(weight,result)
    end

    model.create(lifter_id: lifter.id, 
                 championship_id: championship.id,
                 class_category_id: class_category.id,
                 weight_category_id: weight_category.id,
                 weight: weight,
                 first: hash[:first],
                 second: hash[:second],
                 third: hash[:third],
                 result: result,
                 formula: formula,
                 use_gear: hash[:use_gear],
                 is_disqualified: is_disqualified)
  end
end
