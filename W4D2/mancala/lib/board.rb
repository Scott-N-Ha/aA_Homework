class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = [name1, 6]
    @name2 = [name2, 13]
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_with_index { |cup, index| 4.times { cup << :stone } if index != 6 && index != 13 }
  end

  def valid_move?(start_pos)
    if start_pos.between?(0,5) || start_pos.between?(7,12)
      if @cups[start_pos].empty?
        raise 'Starting cup is empty'
      else
        return true
      end
    else
      raise 'Invalid starting cup'
    end
  end

  def ignore_pos(name)
    @name1[0] == name ? 13 : 6
  end

  def make_move(start_pos, current_player_name)
    # start_pos -= 1
    if valid_move?(start_pos)
      stones = @cups[start_pos] 
      @cups[start_pos] = []

      pos = start_pos
      until stones.empty?
        pos = (pos + 1)%14
        if pos != ignore_pos(current_player_name)
          @cups[pos] += [stones.shift]
        end
      end
      
      render
      next_turn(pos)
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
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
    empty = true
    (0..5).each do |idx|
      empty = false if !@cups[idx].empty?
    end

    return empty if empty

    empty = true
    (0..5).each do |idx|
      empty = false if !@cups[idx].empty?
    end

    empty
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @name1[0]
    when 0
      :draw
    when 1
      @name1[0]
    end
  end
end
