class Board
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3

  def initialize
    @a1 = BoardCase.new
    @a2 = BoardCase.new
    @a3 = BoardCase.new
    @b1 = BoardCase.new
    @b2 = BoardCase.new
    @b3 = BoardCase.new
    @c1 = BoardCase.new
    @c2 = BoardCase.new
    @c3 = BoardCase.new
    @array_board_case = [c1, c2, c3, b1, b2, b3, a1, a2, a3,]
  end

  def array_board_case
    return @array_board_case
  end

  def drawboard
    puts "----+---+----"
    puts "| #{@a1.state} | #{@a2.state} | #{@a3.state} |"
    puts "----+---+----"
    puts "| #{@b1.state} | #{@b2.state} | #{@b3.state} |"
    puts "----+---+----"
    puts "| #{@c1.state} | #{@c2.state} | #{@c3.state} |"
    puts "----+---+----"
  end


end
