
class Date

  def self.from_db(encoded)
    Date.civil(encoded[0..3].to_i, encoded[4..5].to_i, encoded[6..7].to_i)
  end

  def fecha
    self.strftime("%d/%m/%Y")
  end

  def to_db
    self.strftime("%Y%m%d")
  end
end

class Time
  def fecha
    self.strftime("%d/%m/%Y")
  end
end