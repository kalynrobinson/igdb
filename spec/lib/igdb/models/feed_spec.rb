require 'spec_helper'

describe Igdb::Feed do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:feed) { VCR.use_cassette('feed/find') { subject.find 14_428 } }

    it 'returns a feed' do
      expect(feed).to be_a Igdb::Feed
    end
  end
end
