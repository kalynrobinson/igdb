require 'spec_helper'

describe Igdb::Page do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:page) { VCR.use_cassette('page/find') { subject.find 45 } }

    it 'returns a page' do
      expect(page).to be_a Igdb::Page
    end
  end
end
