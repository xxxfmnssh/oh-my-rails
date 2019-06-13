require 'pry'
class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'], Rack::Request.new(env).params)
  end

  def request(method, path, params)
    if path == '/signup'
      if method == 'GET'
        signup = File.open('signup.html').read
        signup = [200, { 'email' => 'foobar@gmail.com', 'password' => 'foobar' }]
        get(path, method, signup)
      elsif method == 'POST'
        email = params['email']
        password = params['password']
        [200, { 'Content-Type' => 'text/html' }, ["Your send next params: email #{email} password #{password}"]]
      end
    else
      request_path(path)
    end
  end

<<<<<<< HEAD
=======
  def get(path, method, _signup, email: 'foobar@gmail.com', password: 'foobar')
    [200, { 'Content-Type' => 'text/html' },
     ["You have requested the path #{path}, using #{method},whith params:#{email}, #{password}"]]
  end

  def post(path, method)
    [201, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path}, using #{method}"]]
  end

>>>>>>> 09e3c7945f8bfe974c218b5ef65a36709d657ad2
  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
