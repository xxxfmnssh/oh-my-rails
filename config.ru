require 'pg'
require 'pry-byebug'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'], Rack::Request.new(env).params)
  end

  def request(method, path, params)
    if path == '/signup'
      if method == 'GET'
        signup = File.open('signup.html').read
        [200, { 'Content-Type' => 'text/html' }, [signup]]
      elsif method == 'POST'
        email = params['email']
        password = params['password']

        db = PG.connect(dbname: 'signup_db', user: 'signup_us', password: 'foobar')
        db.exec("INSERT INTO signup (email, password) VALUES ('#{email}', '#{password}')")

        [200, { 'Content-Type' => 'text/html' }, ["Your send next params: email #{email} password #{password}"]]
      end
    elsif path == '/users'
      if method == 'GET'
        db = PG.connect(dbname: 'signup_db', user: 'signup_us', password: 'foobar')

        list = db.exec('SELECT * FROM signup').to_a

        humanized = list.map do |el|
          "Email: #{el['email']} password: #{el['password']}</br>"
        end.join("\n")

        [200, { 'Content-Type' => 'text/html' }, [humanized]]
      end
    else
      request_path(path)
    end
  end

  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
