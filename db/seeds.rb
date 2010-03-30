# coding: utf-8

ActiveRecord::Base.logger = Logger.new(STDOUT)

User.destroy_all
Bok.destroy_all
Permission.destroy_all


['Booka', 'Dani', 'Tere', 'Omi', 'Paula', 'Malex'].each do |name|
  User.create!(:name => name, :login => "#{name.downcase}@plataformabooka.net",
    :password => 'entrar', :password_confirmation => 'entrar', :rol => 'admin')
end

site = Site.new(:title => 'Plataforma booka', :user_id => 1)
site.save(false)

user = User.first

['Plataforma booka', 'Jardines interfaz', "Arquitectura y género"].each do |name|
  project = site.new_project(user, :title => name)
  project.save!

  project.new_call(user, :title => name).save!
  project.new_index(user, :title => name).save!

  User.all.each do |user|
    project.add_user(user, :admin)
  end

  1.upto(5) do |num|
    project.new_document(user, :title => "Documento #{num}").save
  end

  1.upto(5) do |num|
    project.new_disq(user, :title => "Discussión #{num}").save
  end

end