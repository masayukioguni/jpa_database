ActiveAdmin.register Lifter do
  permit_params :name, :name_kana, :birthday, :gender

  filter :name
  filter :name_kana
  filter :birthday
  filter :gender

  active_admin_importable do |model, hash|
    model.create(name: hash[:name], 
                 name_kana: hash[:name_kana],
                 birthday: hash[:birthday],
                 gender: hash[:gender])
  end

end
