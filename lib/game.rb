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
    if @player_turn < 10 
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
    victory?
  end

  def write_case
    if @player_turn.odd? == true
      my_board.array_board_case[@player_choice - 1].state = @player1.symbol
    else
      my_board.array_board_case[@player_choice - 1].state = @player2.symbol
    end
  end

  def victory?
    if 1 == 1
      return true
    else
      return false
    end
  end

  def restart?

  end
end