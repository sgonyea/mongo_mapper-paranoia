require File.expand_path("../../spec_helper", File.dirname(__FILE__))

describe MongoMapper::Plugins::Paranoia::ActsAsParanoid do
  class ParanoidBySugar
    include MongoMapper::Document
    acts_as_paranoid
  end

  context 'MongoMapper::Plugins::Paranoia Mixin' do
    it 'should be present in the ancestors' do
      ParanoidBySugar.ancestors.should include(MongoMapper::Plugins::Paranoia::InstanceMethods)
    end
  end
end
