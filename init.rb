require 'bundler/setup'
Bundler.require(:default)

Dir["./lib/*.rb"].sort.each {|req| require req}

# Connect to mongodb
MongoMapper.connection = Mongo::Connection.new(Scriptum::Config['host'], Scriptum::Config['port'])
MongoMapper.database = Scriptum::Config['database']

# Require all models
Dir["./models/*.rb"].sort.each {|req| require req}

# Require all applications
Dir["./apps/*.rb"].sort.each {|req| require req}