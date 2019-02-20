# class App
class App
  def call(_env)
    [200, { 'Content-Type' => 'text/html' }, ['Signup me please']]
  end
end
