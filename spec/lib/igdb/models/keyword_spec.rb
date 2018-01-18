require 'spec_helper'

describe Igdb::Keyword do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:keyword) { VCR.use_cassette('keyword/find') { subject.find 4318 } }

    it 'returns a keyword' do
      expect(keyword).to be_a Igdb::Keyword
    end
  end
end
