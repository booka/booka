ActiveRecord::Base.logger = Logger.new(STDOUT)

User.destroy_all
Bok.destroy_all

['Dani', 'Tere', 'Omi', 'Paula', 'Malex'].each do |name|
  User.create!(:name => name, :login => "#{name.downcase}@plataformabooka.net",
    :password => 'entrar', :password_confirmation => 'entrar', :rol => 'admin')
end

site = Site.new(:title => 'Plataforma booka', :user_id => 1)
site.save(false)

['Plataforma booka', 'Jardines interfaz', 'Arquitectura y género'].each do |name|
  project = Project.create!(:title => name, :parent => site, :user_id => 1)
end