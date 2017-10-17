require 'player'

describe Player do
  describe '#initialize' do
    it 'returns the player name' do
      player = Player.new('Nombre')
      name = 'Nombre'

      expect(player.name).to eq(name)
    end
  end
end
