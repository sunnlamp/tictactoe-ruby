require 'player'

describe Player do
  describe '#initialize' do
    it 'returns the player name' do
      name = 'Nombre'
      symbol = 'X'
      player = Player.new(name, symbol)

      expect(player.name).to eq('Nombre')
    end
  end
end
