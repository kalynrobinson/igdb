require 'spec_helper'

describe Igdb::PlayerPerspective do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:player_perspective) { VCR.use_cassette('player_perspective/find') { subject.find 1 } }

    it 'returns a player perspective' do
      expect(player_perspective).to be_a Igdb::PlayerPerspective
    end
  end
end
