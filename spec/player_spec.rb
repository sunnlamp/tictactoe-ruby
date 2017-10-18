require 'player'

describe Player do
  describe '#initialize' do
    it 'returns the player name' do
      name = 'Hal'
      player = Player.new(name)

      expect(player.name).to eq(name)
    end
  end
end
