
class Pointer
  def initialize(raw)
    line = raw.split('|')
    @id = line[0].to_i
    @title = line[1]
    @author = line[2]
  end

  def title
    @title
  end

  def id
    @id
  end

  def author
    @author
  end

  def document?
    @id > 0
  end
end
