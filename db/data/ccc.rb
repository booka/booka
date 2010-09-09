
class Ccc

  def initialize
    @data = File.join(RAILS_ROOT, 'db', 'data', 'CCC')
    puts "DATA: #{@data}"
    #site = Site.get
    #user = User.find(:first)
    #project = site.new_project(user, "De categrales a contenedores")
    #project.save
    add_document(nil, nil, 'De catedrales a contenedores', 'intro.txt')
  end

  def add_document(user, project, title, name)
    puts "DOCUMENT: #{title}"
    file_name = File.join(@data, name)
    file = File.open(file_name, 'r')
    file.each_line do |line|
      if line.match(/^title: /)
        line = line['title: '.length..-1]
        puts "TITLE: #{line}"
      elsif line.match(/^author: /)
        line = line['author: '.length..-1]
        puts "AUTHOR: #{line}"
      elsif line.match(/^</)
        puts "NOTE: #{line}"
      elsif !line.blank?
        puts "PARAGRAPH: #{line}"
      end
    end
  end

end

Ccc.new
