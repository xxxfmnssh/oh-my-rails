require 'pry'
class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'])
  end

  def request(method, path)
    if path == '/signup'
      if method == 'GET'
        signup = File.open('signup.html').read
        signup = [200, { 'email' => 'foobar@gmail.com', 'password' => 'foobar' }]
        get(path, method, signup)
      elsif method == 'POST'
        post(path, method)
      end
    elsif path == '/posts' && method == 'GET'
      posts = File.open('posts.html').read
      [200, { 'Content-Type' => 'text/html' }, [posts]]
    else
      request_path(path)
    end
  end

  def get(path, method, _signup, email: 'foobar@gmail.com', password: 'foobar')
    [200, { 'Content-Type' => 'text/html' },
     ["You have requested the path #{path}, using #{method},whith params:#{email}, #{password}"]]
  end

  def post(path, method)
    [201, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path}, using #{method}"]]
  end

  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
