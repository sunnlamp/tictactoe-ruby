class Player
  attr_reader :name, :symbol

  def initialize(name)
    @name = name
    @symbol = ['X', 'O'].shuffle
  end
end
