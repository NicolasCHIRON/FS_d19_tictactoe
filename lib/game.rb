class Game
  attr_accessor :player1, :player2, :player_turn, :my_board

  def initialize
    # On explique le jeu :
    system("clear")
    puts " " * 18 + "Bienvenue dans ce jeu du morpion ! \n\n"
    puts " " * 7 + "Le principe est de faire une ligne de 3 symboles identiques."
    puts "La sélection de la case à cocher se fait sur le principe du pavé numérique. \n\n"
    puts " " * 25 + "----+---+----"
    puts " " * 25 + "| 7 | 8 | 9 | <= exemple"
    puts " " * 25 + "----+---+----"
    puts " " * 25 + "| 4 | 5 | 6 |"
    puts " " * 25 + "----+---+----"
    puts " " * 25 + "| 1 | 2 | 3 |"
    puts " " * 25 + "----+---+---- \n\n"
    puts "Par exemple, pour sélectionner la case en haut à droite , il suffit de taper 9. \n\n"
    print " " * 8 + "Si vous êtes prêt, appuyer sur 'Entrée' pour continuer :"
    gets.chomp
    system("clear")

    # On demande poliment le nom des deux joueurs :
    puts "Quel est le nom du premier participant ?"
    print "> "
    @player1 = gets.chomp.to_s
    puts "Quel est le nom de son adversaire ?"
    print "> "
    @player2 = gets.chomp.to_s
    puts "Que le meilleur gagne !"

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
    # Affichage du tableau à l'instant t
    system("clear")
      @my_board.drawboard

    # Pour le choix du joueur en fonction des tours de jeu.
    if @player_turn.odd? == true
      puts "C'est le tour de #{@player1.name}. Vous utilisez les #{@player1.symbol}, à vous de jouer !"
    else
      puts "C'est le tour de #{@player2.name}. Vous utilisez les #{@player2.symbol}, à vous de jouer !"
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
    # @my_board.drawboard


    #Pour vérifier les conditions de victoires
    if victory? == true && @player_turn < 10
      system("clear")
      puts "Félicitations, le joueur #{@player_turn.odd? ? @player1.name : @player2.name} a gagné ! \n\n"
      @my_board.drawboard
    elsif victory? == false && @player_turn == 9
      system("clear")
      puts "Match nul, il n'y a pas de gagnant.\n\n"
      @my_board.drawboard
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
    # Condition de victoire = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    # Vérifier si une condition de victoire est activée
    if (@my_board.array_board_case[0].state != " " && @my_board.array_board_case[0].state == @my_board.array_board_case[1].state && @my_board.array_board_case[0].state == @my_board.array_board_case[2].state) ||
      (@my_board.array_board_case[3].state != " " && @my_board.array_board_case[3].state == @my_board.array_board_case[4].state && @my_board.array_board_case[3].state == @my_board.array_board_case[5].state) ||
      (@my_board.array_board_case[6].state != " " && @my_board.array_board_case[6].state == @my_board.array_board_case[7].state && @my_board.array_board_case[7].state == @my_board.array_board_case[8].state) ||
      (@my_board.array_board_case[0].state != " " && @my_board.array_board_case[0].state == @my_board.array_board_case[3].state && @my_board.array_board_case[0].state == @my_board.array_board_case[6].state) ||
      (@my_board.array_board_case[1].state != " " && @my_board.array_board_case[1].state == @my_board.array_board_case[4].state && @my_board.array_board_case[4].state == @my_board.array_board_case[7].state) ||
      (@my_board.array_board_case[2].state != " " && @my_board.array_board_case[2].state == @my_board.array_board_case[5].state && @my_board.array_board_case[2].state == @my_board.array_board_case[8].state) ||
      (@my_board.array_board_case[0].state != " " && @my_board.array_board_case[0].state == @my_board.array_board_case[4].state && @my_board.array_board_case[0].state == @my_board.array_board_case[8].state) ||
      (@my_board.array_board_case[2].state != " " && @my_board.array_board_case[2].state == @my_board.array_board_case[4].state && @my_board.array_board_case[2].state == @my_board.array_board_case[6].state)
      return true
    else
      return false
    end
  end
  
  def restart?
    puts "Voulez-vous recommencer une partie de ce merveilleux jeu ? \n\n"
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
      system("clear")
      puts "Ok, et ben reste seul dans ton coin. \n\n\n"
      puts "Et fais-toi bien chier... \n\n\n"
      puts "CONNARD !!!!\n\n\n"
      return false
    end
  end
end