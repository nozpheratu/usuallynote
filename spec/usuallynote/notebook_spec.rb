require 'spec_helper'

describe UsuallyNote::Notebook do
  describe '.all' do
    subject(:all) { UsuallyNote::Notebook.all } 

    it 'returns UsuallyNote::Notebook collection' do
      VCR.use_cassette("notestore") do
        expect(all).to be_a(Array)
      end
    end

    it 'should have a length of at least 1' do
      VCR.use_cassette("notestore") do
        expect(all.length).to be > 0
      end
    end
  end

  describe '.create' do
    it 'returns a UsuallyNote::Notebook instance' do
      VCR.use_cassette('notestore_create') do
        notebook = UsuallyNote::Notebook.create(name: 'abc1245')
        expect(notebook).to be_a(UsuallyNote::Notebook)
        expect(notebook.name).to eq('abc1245')
      end
    end
  end
end
