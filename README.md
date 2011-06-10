# MongoMapper: Paranoia

## Usage:

### In your Gemfile:

        gem 'mongo_mapper-paranoia', '~>0.0.2'

To force paranoia for all models, from the outset:

        gem 'mongo_mapper-paranoia', '~>0.0.2', :require => 'mongo_mapper/paranoia/force_plugin'

### In your Source Code / Model:

        require 'mongo_mapper/paranoia'

        class ParanoidModel
          include MongoMapper::Document

          acts_as_paranoid
        end

If you already required the force\_plugin, then you don't need to specify 'acts\_as\_paranoid'
