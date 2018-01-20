class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
  end

end

class HumanPlayer
end

class ComputerPlayer
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
  end

  def check_guess(letter)

  end
end
