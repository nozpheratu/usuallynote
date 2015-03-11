require 'spec_helper'

describe UsuallyNote::EvernoteClient do

  describe '.new' do
    it 'creates a new UsuallyNote::EvernoteClient' do
      expect(UsuallyNote::EvernoteClient.new.class).to eq(UsuallyNote::EvernoteClient)
    end
  end
end
