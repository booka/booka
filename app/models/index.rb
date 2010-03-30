class Index < Bok

  def each(&block)
    if body
      body.each do |line|
        yield Pointer.new(line)
      end
    end
  end
end
