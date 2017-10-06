require 'player'

describe Player do
  describe '#initialize' do
    context 'it returns the player name' do
      input = 'Nombre'
      player = Player.new(input)
      expect(player.name).to eq('Nombre')
    end

    context 'it returns the players symbol' do

    end
  end
end
