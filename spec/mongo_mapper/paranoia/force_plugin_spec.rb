require File.expand_path("../../spec_helper", File.dirname(__FILE__))

describe 'MongoMapper::Plugins::Paranoia -- Forced Plugin' do
  require 'mongo_mapper/paranoia/force_plugin'

  class ForcedModel
    include MongoMapper::Document
  end

  context 'MongoMapper::Plugins::Paranoia Mixin' do
    it 'should be present in the ancestors' do
      ForcedModel.ancestors.should include(MongoMapper::Plugins::Paranoia::InstanceMethods)
    end
  end

end
