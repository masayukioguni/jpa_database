ActiveAdmin.register Lifter do
  permit_params :name, :name_kana, :birthday, :gender

  filter :name
  filter :name_kana
  filter :birthday
  filter :gender

end
