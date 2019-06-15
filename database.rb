require 'pg'

db = PG.connect(dbname: 'signup_db', user: 'signup_us', password: 'foobar')
signup = db.exec('SELECT * FROM signup')
signup.each do |signup|
puts signup
end

