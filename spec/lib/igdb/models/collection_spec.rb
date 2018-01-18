require 'spec_helper'

describe Igdb::Collection do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:collection) { VCR.use_cassette('collection/find') { subject.find 1 } }

    it 'returns a collection' do
      expect(collection).to be_a Igdb::Collection
    end
  end
end
