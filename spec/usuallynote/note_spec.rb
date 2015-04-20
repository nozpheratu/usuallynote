require 'spec_helper'

describe UsuallyNote::Note do
  let(:note) do
    VCR.use_cassette('get_note') do
      guid = 'e79ece1a-f266-4712-aaf0-eb6ec80f3fff'
      UsuallyNote::Note.find(guid, include_content: true)
    end
  end

  describe '.create' do
    it 'returns a new UsuallyNote::Note instance' do
      expect(UsuallyNote::Note.create.class).to eq(UsuallyNote::Note)
    end
  end

  describe '#content' do
    it 'returns an XHTML string' do
      expect(note.content).to match(/xml/)
    end
  end
end
