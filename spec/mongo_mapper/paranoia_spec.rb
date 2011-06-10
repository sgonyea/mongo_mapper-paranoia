require File.expand_path("../spec_helper", File.dirname(__FILE__))

describe MongoMapper::Plugins::Paranoia do
  class ParanoidByInclude
    include MongoMapper::Document
    include MongoMapper::Plugins::Paranoia
  end

  context 'The plugin should mix in methods and keys' do
    before(:each) do
      @paranoid = ParanoidByInclude.new
    end

    describe '#deleted_at' do
      it 'should be included via the plugin interface' do
        @paranoid.should respond_to(:deleted_at)
      end
    end

    describe '#destroy, #delete' do
      it 'should be included via the plugin interface' do
        @paranoid.should respond_to(:destroy)
        @paranoid.should respond_to(:delete)
      end
    end

    describe '#destroyed?, #deleted?' do
      it 'should be included via the plugin interface' do
        @paranoid.should respond_to(:destroyed?)
        @paranoid.should respond_to(:deleted?)
      end
    end
  end

  context 'When destroying instances' do
    before(:each) do
      @paranoid = ParanoidByInclude.create!
    end

    context 'Instance Methods' do
      describe '#destroy' do
        it 'should set the deleted_at timestamp' do
          @paranoid.deleted_at.should be_nil
          @paranoid.destroy

          @paranoid.deleted_at.should be_present
          @paranoid.deleted_at.should be_a(Time)
        end
      end

      describe '#destroyed?' do
        it 'should be true if the object has been destroyed' do
          @paranoid.destroyed?.should be_false
          @paranoid.destroy

          @paranoid.destroyed?.should be_true
        end
      end
    end

    context 'Persistence' do
      it 'should still be destroyed, when queried from the server' do
        pid = @paranoid.id
        @paranoid.destroy

        persistanoid = ParanoidByInclude.find(pid)
        persistanoid.destroyed?.should be_true
        persistanoid.deleted_at.should be_present
      end
    end
  end
end
