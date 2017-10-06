require 'player'

describe Player do
  describe '#initialize' do
    it 'returns the player name' do
      name = 'Nombre'
      player = Player.new(name)

      expect(player.name).to eq('Nombre')
    end

    it 'assigns the players a symbol' do
      player = Player.new('Name')
      puts player.symbol
      expect(player.symbol).to include('X' || 'O')
    end
  end
end
