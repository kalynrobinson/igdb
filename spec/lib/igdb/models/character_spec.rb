require 'spec_helper'

describe Igdb::Character do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:character) { VCR.use_cassette('character/find') { subject.find 1 } }

    it 'returns a character' do
      expect(character).to be_a Igdb::Character
    end
  end
end
