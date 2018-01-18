require 'spec_helper'

describe Igdb::GameMode do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:game_mode) { VCR.use_cassette('game_mode/find') { subject.find 1 } }

    it 'returns a game mode' do
      expect(game_mode).to be_a Igdb::GameMode
    end
  end
end
