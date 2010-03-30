# coding: utf-8
require 'faker'

class Generator
  # ActiveRecord::Base.logger = Logger.new(STDOUT)

  IMAGES = %w(http://www.we-make-money-not-art.com/wow/madagascar_542.jpg http://www.we-make-money-not-art.com/wow/4338141675_ba5ded89cf_b.jpg
    http://www.we-make-money-not-art.com/wow/0po4338126049_fb7234cb28_b.jpg http://www.we-make-money-not-art.com/wow/walton5.jpg
    http://www.we-make-money-not-art.com/wow/ford1.jpg http://www.we-make-money-not-art.com/wow/4338132579_0e6fc79568_b.jpg
    http://www.we-make-money-not-art.com/wow/4338134315_5c16db5e4a_b.jpg)

  VIDEOS = %w(http://www.youtube.com/watch?v=Uy2tEP3I3DM
  http://www.youtube.com/watch?v=kbje6cyAzqY http://www.youtube.com/watch?v=WnaLH_V1Nso
  http://www.youtube.com/watch?v=xhtG5YrQ-lY http://www.youtube.com/watch?v=Sq0EH4g3DZg
  http://www.youtube.com/watch?v=H6BiwajDrYA)

  def generate
    destroy_data



    ['Booka', 'Dani', 'Tere', 'Omi', 'Paula', 'Malex'].each do |name|
      User.create!(:name => name, :login => "#{name.downcase}@plataformabooka.net",
        :password => 'entrar', :password_confirmation => 'entrar', :rol => 'admin')
    end

    site = Site.new(:title => 'Plataforma booka', :user_id => 1)
    site.save(false)

    user = User.first

    ['Plataforma booka', 'Jardines interfaz', "Arquitectura y género"].each do |name|
      create_project(user, site, name)
    end
  end

  def create_project(user, site, project_name)
    project = site.new_project(user, :title => project_name)
    project.save!

    call = project.new_call(user, :title => "Convocatoria de '#{project_name}'")
    call.save!
    1.upto(3) { call.new_clip(user, :body => paragraphs(5), :content_type => 'text/auto_html').save! }
    index = project.new_index(user, :title => project_name)
    index.body = generate_index_body
    index.save!

    User.all.each do |user|
      project.add_user(user, :admin)
    end

    1.upto(5) do |num|
      doc = project.new_document(user, :title => Faker::Lorem.sentence(rand(6) + 1))
      doc.save!
      1.upto(5) { doc.new_clip(user, :body => paragraphs(3), :content_type => 'text/auto_html').save! }
    end

    1.upto(5) do |num|
      disq = project.new_disq(user, :title => Faker::Lorem.sentence(3), :body => paragraphs(3), :content_type => Disq::TYPES[rand(2)])
      disq.save!
      add_responses(user, disq, rand(2) + 1)
    end
  end

  def paragraphs(number = 3)
    paragraphs = Faker::Lorem.paragraphs(rand(number) + 1)
    
    middle = rand(10)
    paragraphs << "El random es: #{middle}"
    if middle < 5
      paragraphs << Faker::Lorem.paragraph(number) + rand_image + Faker::Lorem.paragraph(number) 
    elsif middle < 8
      paragraphs << Faker::Lorem.paragraph(number) + rand_video + Faker::Lorem.paragraph(number)
    end
    
    paragraphs << Faker::Lorem.paragraphs(rand(number))
    paragraphs.map {|d| "<p>#{d}</p>"}.join
  end

  def rand_image
    " #{IMAGES[rand(IMAGES.size)]}\n "
  end

  def rand_video
    " #{VIDEOS[rand(VIDEOS.size)]}\n "
  end

  def add_responses(user, disq, number)
    1.upto(number) do
      child = disq.new_response(user, :title => Faker::Lorem.sentence(3), :body => paragraphs(3), :content_type => Disq::TYPES[0])
      child.save!
      add_responses(user, child, rand(2))
    end
  end

  def generate_index_body
    body = ""
    1.upto(12) do |number|
      body = body + "#{number}. #{Faker::Lorem.sentence(rand(5) + 1)}\n"
      add_child_index(body, number)
    end
    body
  end

  def add_child_index(body, parent)
    1.upto(rand(5)) do |number|
      body = body + "#{parent}.#{number}. #{Faker::Lorem.sentence(rand(5) + 1)}\n"
    end
    body
  end


  def destroy_data
    User.destroy_all
    Bok.destroy_all
    Permission.destroy_all
  end
end

Generator.new.generate