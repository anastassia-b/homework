#Anastassia Bobokalonova
#June 3, 2017

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    welcome_message
    take_turn until @game_over

    game_over_message
    reset_game
  end

  def welcome_message
    puts "--------------------------"
    puts "Welcome to the Simon Game!"
    puts "--------------------------"
    sleep(2)
    system("clear")
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      increase_sequence_length
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(0.2)
    end
  end

  def require_sequence
    puts "Enter the color sequence, hitting enter after each color: "
    @seq.each do |color|
      guess = gets.chomp
      if color != guess
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def increase_sequence_length
    @sequence_length += 1
  end

  def round_success_message
    puts "That's correct!"
    sleep(2)
    system("clear")
  end

  def game_over_message
    puts "Aww, game over! Your sequence was this long: #{sequence_length}."
    puts "Try again?"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
