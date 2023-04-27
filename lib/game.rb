class Game
  attr_accessor :player1, :player2, :player_turn, :my_board

  def initialize (player1, player2)
    @player1 = Player.new(player1, "X")
    @player2 = Player.new(player2, "O")
    @player_turn = 0
    @my_board = Board.new
    @player_choice ='nil'
  end

  def is_still_ongoing?
    @player_turn += 1 
    if @player_turn < 10 && victory? == false
      return true
    else
      return false
    end
  end

  def menu
    #Pour afficher le tableau vide en début de partie.
    if @player_turn == 1
      @my_board.drawboard
    end
    #Pour le choix du joueur en fonction des tours de jeu.
    if @player_turn.odd? == true
      puts "C'est à #{@player1.name} de jouer. Vous êtes les #{@player1.symbol}, à vous de jouer !"
    else
      puts "C'est à #{@player2.name} de jouer. Vous êtes les #{@player2.symbol}, à vous de jouer !"
    end
    puts "Choisissez votre case selon le schéma du pavé numérique :"
  end

  def menu_choice

    print "> "

    #Boucle pour vérifier que l'utilisateur tape un nombre compris entre 1 et 9
    while @player_choice = gets.chomp.to_i
      break if (1..9).include?(@player_choice) == true
      puts "Merci de vous servir de votre pavé numérique. Veuillez retenter :"
      print "> "
    end
      #Boucle pour vérifier que l'utilisateur a choisi une case vide
    while (1..9).include?(@player_choice) == false || my_board.array_board_case[@player_choice - 1].state == "X" || my_board.array_board_case[@player_choice - 1].state == "O"
        puts "Cette case a déjà été choisie, veuillez en sélectionner une autre :"
        print "> "
        @player_choice = gets.chomp.to_i
    end


    #Code pour écrire dans le tableau le choix de l'utilisateur
    write_case

    #Affichage du tableau après choix
    @my_board.drawboard

    #Pour vérifier les conditions de victoires
    if victory? == true && @player_turn < 10
      puts "Félicitations, le joueur #{@player_turn.odd? ? @player1.name : @player2.name} a gagné !"
    elsif victory? == false && @player_turn == 9
      puts "Match nul, il n'y a pas de gagnant."
    end
  end

  def write_case
    if @player_turn.odd? == true
      my_board.array_board_case[@player_choice - 1].state = @player1.symbol
    else
      my_board.array_board_case[@player_choice - 1].state = @player2.symbol
    end
  end

  def victory?
    winning_positions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    # check if a winning combination exists for the current player
    if @my_board.array_board_case[0].state != " " && @my_board.array_board_case[0].state == @my_board.array_board_case[1].state && @my_board.array_board_case[0].state == @my_board.array_board_case[2].state
    # if winning_positions.any? { |pos| pos.all? { |pos1, pos2, pos3|  @my_board.array_board_case[pos1].state == @my_board.array_board_case[pos2].state && @my_board.array_board_case[pos2].state == @my_board.array_board_case[pos3].state && @my_board.array_board_case[pos1].state != " "} } == true
      return true
    else
      return false
    end
  end
  
  def restart?
    puts "Voulez-vous recommencer une partie de ce merveilleux jeu ?"
    puts "[y] Oh oui avec grand plaisir !   [n] Laisse-moi tranquille avec ton jeu de merde !"
    print "> "

    while input = gets.chomp.to_s.downcase
      break if input == "n" || input == "y"
      puts "C'est pourtant pas compliqué, il n'y a que deux choix ... Aller, tu peux choisir de nouveau"
      print "> "
    end

    case input
    when "y"
      return true
    when "n"
      return false
    end
  end
end