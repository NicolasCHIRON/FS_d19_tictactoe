require_relative 'player'

class Game
  attr_accessor :player1, :player2, :player_turn, :array_board_case

  def initialize (player1, player2)
    @player1 = Player.new(player1, "X")
    @player2 = Player.new(player2, "O")
    @player_turn = 1
    a1 = BoardCase.new
    a2 = BoardCase.new
    a3 = BoardCase.new
    b1 = BoardCase.new
    b2 = BoardCase.new
    b3 = BoardCase.new
    c1 = BoardCase.new
    c2 = BoardCase.new
    c3 = BoardCase.new
    @array_board_case = [a1, a2, a3, b1, b2, b3, c1, c2, c3]
    @player_choice ='nil'
  end

  def is_still_ongoing?
    return true
  end

  def menu
    if @player_turn.odd? == true
      puts "C'est à #{@player1.name} de jouer. Vous êtes les #{@player1.symbol}, à vous de jouer !"
    else
      puts "C'est à #{@player2.name} de jouer. Vous êtes les #{@player2.symbol}, à vous de jouer !"
    end
    puts "Choisissez votre case selon le schéma du pavé numérique :"
    @player_turn +=1
  end

  def menu_choice

    print "> "

    #Boucle pour vérifier que l'utilisateur tape un nombre compris entre 1 et 9
    while @player_choice = gets.chomp.to_i
      break if (1..9).include?(@player_choice) == true
      puts "Merci de vous servir de votre pavé numérique. Veuillez retenter :"
      print "> "
    
      #Boucle pour vérifier que l'utilisateur a choisi une case vide
      while @array_board_case[@player_choice + 1].state == 'nil'
        puts "Cette case a déjà été choisie, veuillez en sélectionner une autre :"
      end
    end

    #Code pour écrire dans le tableau le choix de l'utilisateur
    write_case
    @array_board_case.each{|i| puts "#{i.state}"}
  end

  def write_case
    if @player_turn.odd? == true
      @array_board_case[@player_choice + 1].state = @player1.symbol
    else
      @array_board_case[@player_choice + 1].state = @player2.symbol
    end
  end

  # def victory
  #   if
  #     return true
  #   else
  #     return false
  #   end
  # end

  def restart?

  end
end