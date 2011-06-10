require 'bundler/setup'

Bundler.require :development
Bundler.require :default

MongoMapper.connection  = ::Mongo::ReplSetConnection.new(["localhost", 27017])
MongoMapper.database    = 'mongo_mapper-paranoia-test'

Dir[ Bundler.root.join("spec/support/**/*.rb") ].each{|f| require f}
