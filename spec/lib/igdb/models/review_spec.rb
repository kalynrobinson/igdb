require 'spec_helper'

describe Igdb::Review do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:review) { VCR.use_cassette('review/find') { subject.find 2234 } }

    it 'returns a review' do
      expect(review).to be_a Igdb::Review
    end
  end
end
