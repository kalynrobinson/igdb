require 'spec_helper'

describe Igdb::Person do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:person) { VCR.use_cassette('person/find') { subject.find 2178 } }

    it 'returns a person' do
      expect(person).to be_a Igdb::Person
    end
  end
end
