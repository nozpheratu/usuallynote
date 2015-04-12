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
        notebook = UsuallyNote::Notebook.create(name: 'My Note')
        expect(notebook).to be_a(UsuallyNote::Notebook)
        expect(notebook.name).to eq('My Note')
      end
    end
  end

  describe '.update' do
    it 'updates values' do
      VCR.use_cassette('notestore_update') do
        notebook = UsuallyNote::Notebook.all.first
        notebook.name = 'Updated Notebook Name!'
        expect{notebook.update}.to change{UsuallyNote::Notebook.all.first.name}
      end
    end
  end

  describe '.delete' do
    it 'deletes itself' do
      VCR.use_cassette('notebook_delete') do
        notebook = UsuallyNote::Notebook.all.first
        expect{notebook.delete}.to change{UsuallyNote::Notebook.all.size}
      end
    end
  end
end
