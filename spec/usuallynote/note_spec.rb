require 'spec_helper'

describe UsuallyNote::Note do
  describe '.create' do
    it 'returns a new UsuallyNote::Note instance' do
      expect(UsuallyNote::Note.create.class).to eq(UsuallyNote::Note)
    end
  end
end
