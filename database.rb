# require 'pg'

# module Database
#   def insert(email, password)
#     db = PG.connect(dbname: 'signup_db', user: 'signup_us', password: 'foobar')
#     db.exec("INSERT INTO signup (email, password) VALUES ('#{email}', '#{password}')")
#   end
# end
