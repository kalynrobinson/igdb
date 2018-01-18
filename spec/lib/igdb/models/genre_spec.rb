require 'spec_helper'

describe Igdb::Genre do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:genre) { VCR.use_cassette('genre/find') { subject.find 13 } }

    it 'returns a genre' do
      expect(genre).to be_a Igdb::Genre
    end
  end
end
