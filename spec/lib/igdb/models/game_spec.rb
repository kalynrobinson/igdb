require 'spec_helper'
require 'pp'

describe Igdb::Game do
  subject { described_class }

  before do
    Igdb.connect(ENV['IGDB_KEY'])
  end

  describe 'public class methods' do
    context 'responds to its methods' do
      it { expect(subject).to respond_to(:meta) }
      it { expect(subject).to respond_to(:count) }
      it { expect(subject).to respond_to(:find) }
      it { expect(subject).to respond_to(:select) }
      it { expect(subject).to respond_to(:all) }
    end

    context 'executes methods correctly' do
      context 'self.meta' do
        let(:game) { VCR.use_cassette('game/meta') { subject.meta } }

        it 'return the fields of game' do
          expect(game).to be_a Array
        end
      end

      context 'self.count' do
        let(:game) { VCR.use_cassette('game/count') { subject.count } }

        it 'return the number of games in the database' do
          expect(game).to be_a Integer
        end
      end

      context 'self.find' do
        let(:game) { VCR.use_cassette('game/find') { subject.find 2000 } }
        let(:game_by_slug) { VCR.use_cassette('game/find-by-slug') { subject.find 'postal' } }

        it 'returns a game' do
          expect(game).to be_a Igdb::Game
          expect(game_by_slug).to be_a Igdb::Game
        end

        it 'returns the correct game' do
          expect(game.name).to eq 'Postal'
          expect(game_by_slug.id).to eq 2000
        end
      end

      context 'self.select' do
        let(:game) { VCR.use_cassette('game/select') { subject.select 1, 2, 3 } }

        it 'returns a selection of games' do
          expect(game).to be_a Array
          expect(game).not_to be_empty
          expect(game.first).to be_a Igdb::Game
          expect(game.size).to eq 3
        end

        it 'returns the correct games' do
          expect(game[0].name).to eq 'Thief II: The Metal Age'
          expect(game[1].name).to eq 'Thief: The Dark Project'
          expect(game[2].name).to eq 'Thief: Deadly Shadows'
        end
      end

      context 'self.all' do
        let(:game) { VCR.use_cassette('game/all') { subject.all } }
        let(:game_with_limit) { VCR.use_cassette('game/all-limit') { subject.all limit: 5 } }

        it 'returns a list of games' do
          expect(game).to be_a Array
          expect(game).not_to be_empty
          expect(game.first).to be_a Igdb::Game
          expect(game.size).to eq 50
        end

        it 'returns a limit' do
          expect(game_with_limit).to be_a Array
          expect(game_with_limit.size).to eq 5
        end
      end
    end
  end
end
