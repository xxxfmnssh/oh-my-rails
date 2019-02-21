class Application
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /signup/
      [200, { 'Content-Type' => 'text/html' }, ['<h1>Signup me please</h1>']]
    else
      [200, { 'Content-Type' => 'text/html' }, ['<html><body><h1>Hello World</h1></body></html>']]
    end
  end
end

run Application.new
