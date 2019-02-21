# class Application
class Application
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /signup/
      [200, { 'Content-Type' => 'text/html' }, ['Signup me please']]
    else
      [200, { 'Content-Type' => 'text/html' }, ['Hello World']]
    end
  end
end

run Application.new
