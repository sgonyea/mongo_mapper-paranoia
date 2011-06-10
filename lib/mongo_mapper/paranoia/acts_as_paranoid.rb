require 'mongo_mapper/paranoia'

module MongoMapper
  module Plugins
    module Paranoia
      module ActsAsParanoid
        extend ActiveSupport::Concern

        module ClassMethods
          # Includes the MongoMapper::Plugins::Paranoia MongoMapper Plugin
          # @see MongoMapper::Plugins::Paranoia
          def acts_as_paranoid
            self.send(:include, ::MongoMapper::Plugins::Paranoia)
          end
        end

        module InstanceMethods; end

      end
    end
  end
end
