require 'player'

describe Player do
  describe '#initialize' do
    it 'returns the player name' do
      name = 'Nombre'
      player = Player.new(name)

      expect(player.name).to eq('Nombre')
    end
  end
end
