require 'pry'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'])
  end

  def request(method, path)
    if method == 'GET'
      get(path)
    elsif method == 'POST'
      post(path)
    end
  end

  def get(path)
    [200, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path},using GET"]]
  end

  def post(path)
    [201, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path},using POST"]]
  end
end

run Application.new

