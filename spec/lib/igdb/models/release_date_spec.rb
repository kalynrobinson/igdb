require 'spec_helper'

describe Igdb::ReleaseDate do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:release_date) { VCR.use_cassette('release_date/find') { subject.find 19_271 } }

    it 'returns a release date' do
      expect(release_date).to be_a Igdb::ReleaseDate
    end
  end
end
