require 'active_support/core_ext/object'
require 'mongo_mapper'
require 'mongo_mapper/plugins'

require 'mongo_mapper/paranoia/version'
require 'mongo_mapper/paranoia/acts_as_paranoid'

module MongoMapper
  module Plugins
    module Paranoia
      extend ActiveSupport::Concern

      included do
        key :deleted_at, Time, :index => true
      end

      module ClassMethods; end

      module InstanceMethods
        # Destroys the instance
        # @see ActiveModel::Callbacks
        def destroy
          run_callbacks(:destroy) do
            update_attribute(:deleted_at, Time.now)
          end
        end
        alias :delete :destroy

        # @return [true, false] Whether or not the deleted_at attribute is set
        def destroyed?
          self.deleted_at.present?
        end
        alias :deleted? :destroyed?
      end

    end
  end
end

MongoMapper::Document.plugin(MongoMapper::Plugins::Paranoia::ActsAsParanoid)
MongoMapper::EmbeddedDocument.plugin(MongoMapper::Plugins::Paranoia::ActsAsParanoid)
