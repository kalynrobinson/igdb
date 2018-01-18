require 'spec_helper'

describe Igdb::Title do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:title) { VCR.use_cassette('title/find') { subject.find 21_253 } }

    it 'returns a title' do
      expect(title).to be_a Igdb::Title
    end
  end
end
