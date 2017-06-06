class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      @cups[i] = [:stone, :stone, :stone, :stone]
    end

  end

  def valid_move?(start_pos)
    unless start_pos.between?(1, 12)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    next_pos = start_pos

    until @cups[start_pos].empty?
      next_pos = (next_pos + 1) % cups.length
      next if (current_player_name == @name1 && next_pos == 13) ||
              (current_player_name == @name2 && next_pos == 6)
      @cups[next_pos] << @cups[start_pos].pop
    end

    render
    #RETURN VALUE HERE DETERMINES WHETHER TURN IS OVER OR NOT
    next_turn(next_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    #IF the current player ends on an empty cup (that now has 1 stone in it),
    #the return value should be :switch.
    #IF current player ends up in a cup that already has stones in it,
    #return value should be ending_cup_idx, and then itll make the move.
    #IF ends in own cup, return value is :prompt
    if current_player_name == @name1
      if ending_cup_idx < 6
        if @cups[ending_cup_idx].length == 1
          :prompt
        else
          ending_cup_idx
        end
      else
        if @cups[ending_cup_idx].length == 1
          :switch
        else
          ending_cup_idx
        end
      end
    else
      if ending_cup_idx > 6
        if @cups[ending_cup_idx].length == 1
          :prompt
        else
          ending_cup_idx
        end
      else
        if @cups[ending_cup_idx].length == 1
          :switch
        else
          ending_cup_idx
        end
      end
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    ((0..5).all? {|i| @cups[i].empty?}) || ((7..12).all? {|i| @cups[i].empty?})
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[13].length > @cups[6].length
      @name2
    else
      :draw
    end
  end
end
