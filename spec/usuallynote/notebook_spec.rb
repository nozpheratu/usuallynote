require 'spec_helper'

describe UsuallyNote::Notebook do
  describe '.all' do
    subject(:all) { UsuallyNote::Notebook.all } 
    before do
  stub_request(:post, "https://sandbox.evernote.com/edam/user").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-thrift', 'User-Agent'=>'evernote-thrift gem / 1.25.1; Ruby / 2.1.2;'}).to_return(:status => 200, :body => "", :headers => {})

    end
    it 'returns UsuallyNote::Notebook collection' do
      expect(all).to be_a(Array)
    end

    it 'should have a length of at least 1' do
      expect(all.length).to be > 0
    end
  end
end
