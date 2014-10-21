require 'rails_helper'

Rspec::PowerAssert.describe AdminUtil do
  describe '#record' do
    it 'is nil ' do
      is_asserted_by { AdminUtil.record(nil) == 0 }
    end
    it 'to float ' do
      is_asserted_by { AdminUtil.record('220.5') == 220.5 }
    end
  end
  describe '#normalize' do
    it 'normalize ' do
      is_asserted_by { AdminUtil.normalize('小國 正之') == '小國 正之' }
    end
  end

  describe '#lifter' do
    it 'exist ' do
      lifter = FactoryGirl.create(:lifter, gender: 'male')
      row = AdminUtil.lifter(lifter.name, lifter.gender)
      is_asserted_by { row.name == lifter.name }
      is_asserted_by { row.gender == lifter.gender }
    end

    it 'create' do
      lifter = FactoryGirl.build(:lifter, gender: 'male')
      row = AdminUtil.lifter(lifter.name, lifter.gender)
      is_asserted_by { row.name == lifter.name }
      is_asserted_by { row.gender == lifter.gender }
    end
  end

  describe '#championship' do
    it 'exist ' do
      championship = FactoryGirl.create(:championship)
      row = AdminUtil.championship(championship.name)
      is_asserted_by { row.id == championship.id }
    end

    it 'create' do
      championship = FactoryGirl.build(:championship)
      row = AdminUtil.championship(championship.name)
      is_asserted_by { row.present? }
    end
  end

  describe '#weight_category' do
    it 'exist ' do
      weight_category = FactoryGirl.create(:weight_category)
      row = AdminUtil.weight_category(weight_category.name)
      is_asserted_by { row.id == weight_category.id }
    end

    it 'create' do
      weight_category = FactoryGirl.build(:weight_category)
      row = AdminUtil.weight_category(weight_category.name)
      is_asserted_by { row.present? }
    end
  end

  describe '#class_category' do
    it 'exist ' do
      class_category = FactoryGirl.create(:class_category)
      row = AdminUtil.class_category(class_category.name)
      is_asserted_by { row.id == class_category.id }
    end

    it 'create' do
      class_category = FactoryGirl.build(:class_category)
      row = AdminUtil.class_category(class_category.name)
      is_asserted_by { row.present? }
    end
  end

  describe '#exist?' do
    it 'exist ' do
      row = FactoryGirl.create(:benchpress)
      is_asserted_by { AdminUtil.exist?(Benchpress, row.id, row.championship_id) == true }
    end

    it 'not exist' do
      is_asserted_by { AdminUtil.exist?(Benchpress, 999_999, 9_999_999) == false }
    end
  end

  describe '#result' do
    it '3 attempt success' do
      is_asserted_by { AdminUtil.result(100, 105.5, 200) == 200 }
    end

    it '1 attempt success' do
      is_asserted_by { AdminUtil.result(100, -105.5, 0) == 100 }
    end

    it 'failed ' do
      is_asserted_by { AdminUtil.result(-100, -105.5, 0) == 0 }
    end
  end

  describe '#disqualified?' do
    it 'disqualified ' do
      is_asserted_by { AdminUtil.disqualified?(0) == true }
    end

    it 'not disqualified' do
      is_asserted_by { AdminUtil.disqualified?(100) == false }
    end
  end

  describe '#pl_disqualified?' do
    it 'pl_disqualified ' do
      is_asserted_by { AdminUtil.pl_disqualified?(0, 100, 110) == true }
    end

    it 'not pl_disqualified' do
      is_asserted_by { AdminUtil.pl_disqualified?(1, 2, 3) == false }
    end
  end

  describe '#formula' do
    it 'formula male ' do
      is_asserted_by { AdminUtil.formula('male', 60, 600) == 511.74 }
    end

    it 'formula female' do
      is_asserted_by { AdminUtil.formula('female', 60, 600) == 668.94 }
    end
  end

  describe '#use_gear?' do
    it 'TRUE ' do
      is_asserted_by { AdminUtil.use_gear?('TRUE') == true }
    end

    it 'false' do
      is_asserted_by { AdminUtil.use_gear?('false') == false }
    end
  end

end
