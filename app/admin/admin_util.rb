class AdminUtil
  class << self
    def record(value)
     value.nil? ?  0 : value.to_f 
    end
  
    def normalize(value)
     value.force_encoding("utf-8").scrub('?')
    end


    def lifter(hash)
      name = normalize hash[:name]
      gender = normalize hash[:gender]
      lifter = Lifter.where('name LIKE ?', "%#{name}%").first
      lifter = Lifter.create(name: name,
                             name_kana: "test",
                             gender: gender.downcase) if lifter.blank?
      return lifter
    end

    def championship(hash)
      name = normalize hash[:name]
      championship = Championship.select(:id).where('name LIKE ?', "%#{name}%").first
      championship = Championship.create(name: name) if championship.blank? 
      return championship
    end

    def weight_category(hash)
      name = normalize hash[:name]
      weight_category = WeightCategory.select(:id).where('name LIKE ?', "%#{name}%").first
      weight_category = WeightCategory.create(name: name) if weight_category.blank? 
      return weight_category
    end

    def class_category(hash)
      name = normalize hash[:name]
      class_category = ClassCategory.select(:id).where('name LIKE ?', "%#{name}%").first
      class_category = ClassCategory.create(name: name) if class_category.blank?
      return class_category
    end

    def exist?(model,lifter_id,championship_id)
      model.where('lifter_id = ? AND championship_id = ?',lifter_id,championship_id).count != 0
    end

    def result(first,second,third)
      [first,second,third,0].max
    end

    def disqualified?(result)
      result == 0 ? true : false
    end

    def pl_disqualified?(sq,bp,dl)
      (sq == 0 || bp == 0 || dl == 0) ? true : false
    end

    def formula(gender,weight,result)
      if gender.downcase == 'male'
        return Wilksformula.men_formula(weight,result)
      else
        return Wilksformula.women_formula(weight,result)
      end
    end

    def use_gear?(gear)
      gear.downcase == 'true'
    end
  end
end