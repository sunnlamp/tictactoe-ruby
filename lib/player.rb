class Player
  attr_reader :name, :symbol

  def initialize(name)
    @name = name
    @symbol = ['X', 'O'].sample
  end
end
