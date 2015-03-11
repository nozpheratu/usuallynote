require 'spec_helper'

describe UsuallyNote do
  let(:auth_token) { 'xxx' }

  describe 'configuration' do
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
end
