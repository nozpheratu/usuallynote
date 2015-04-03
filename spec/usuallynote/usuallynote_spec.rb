require 'spec_helper'

describe UsuallyNote do
  let(:auth_token) { 'xxx' }
  
  describe '.connection' do
    it 'returns a UsuallyNote::Connection instance' do
      expect(UsuallyNote.connection.class).to eq(UsuallyNote::Connection)
    end
  end

  describe '.configuration' do
    before(:each) do
      UsuallyNote.configure do |config|
        config.auth_token = auth_token
      end
    end

    after :each do
      UsuallyNote.reset
    end

    describe '.configure' do
      it 'has a custom configuration' do
        expect(UsuallyNote.configuration.auth_token).to match auth_token
      end
    end

    describe '.reset' do
      before(:each) do
        UsuallyNote.configure do |config|
          config.auth_token = auth_token
        end
      end

      it 'resets the configuration' do
        UsuallyNote.reset
        config = UsuallyNote.configuration
        expect(config.auth_token).to eq ''
      end
    end
  end

  describe '.start' do
    it 'returns a UsuallyNote::Application instance' do
      expect(UsuallyNote.start.class).to eq(UsuallyNote::Application)
    end
  end
end
