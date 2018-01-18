require 'spec_helper'

describe Igdb::Franchise do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:franchise) { VCR.use_cassette('franchise/find') { subject.find 1039 } }

    it 'returns a franchise' do
      expect(franchise).to be_a Igdb::Franchise
    end
  end
end
