class RequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    @start = Time.now
    log = true if env['PATH_INFO'].match /^.*.json$/
    query(env, log) if log
    @status, @headers, @response = @app.call(env)
    @stop = Time.now
    response(@start, @status, @headers, @response) if log
    sleep(2) if log
    [@status, @headers, @response]
  end

  def query(env, log)
    puts "#{log} ================================================================================"
    puts env['PATH_INFO']
    puts "QUERY STRING:"
    puts env['QUERY_STRING']
  end

  def response(start, status, headers, resp)
    puts "TIME: #{Time.now - start} ms."
    puts "RESPONSE: "
    resp.each {|line| puts line.to_s }
    puts "============="
    puts resp
    puts "================================================================================"
  end

end
