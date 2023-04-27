class BoardCase
  attr_accessor :state

  def initialize
    @state = " "
  end

  def verif_state
    return @state
  end

  # Pour pouvoir modifier l'état de la case en fonction des choix des joueurs

end
