class Player
  attr_accessor :name, :symbol, :score

  def initialize (name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

end