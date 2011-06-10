require 'mongo_mapper/paranoia'

MongoMapper::Document.plugin(MongoMapper::Plugins::Paranoia)
MongoMapper::EmbeddedDocument.plugin(MongoMapper::Plugins::Paranoia)
