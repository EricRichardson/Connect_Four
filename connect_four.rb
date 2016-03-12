class Connect_four

  def initialize
    row = Array.new(7, '- ')
    @board = {first: row.dup, second: row.dup, third: row.dup,
              fourth: row.dup, fifth: row.dup, sixth: row.dup}
  end

  def display
    puts @board[:sixth].join
    puts @board[:fifth].join
    puts @board[:fourth].join
    puts @board[:third].join
    puts @board[:second].join
    puts @board[:first].join
    puts "1 2 3 4 5 6 7"
  end

  def play_piece (player1 = true)
    puts player1 ? "Player 1 to play" : "Player 2 to play"
    begin
      input = get_input
      if @board[:first][input] == '- '
      player1 ?  @board[:first][input] = 'R ' : @board[:first][input] = 'B '
      not_full = true
      elsif @board[:second][input] == '- '
      player1 ?  @board[:second][input] = 'R ' : @board[:second][input] = 'B '
      not_full = true
      elsif @board[:third][input] == '- '
      player1 ?  @board[:third][input] = 'R ' : @board[:third][input] = 'B '
      not_full = true
      elsif @board[:fourth][input] == '- '
      player1 ?  @board[:fourth][input] = 'R ' : @board[:fourth][input] = 'B '
      not_full = true
      elsif @board[:fifth][input] == '- '
      player1 ?  @board[:fifth][input] = 'R ' : @board[:fifth][input] = 'B '
      not_full = true
      elsif @board[:sixth][input] == '- '
      player1 ?  @board[:sixth][input] = 'R ' : @board[:sixth][input] = 'B '
      not_full = true
      else
        not_full = false
        puts "Column full! Select another column!"
      end
    end while (!not_full)
  end

  def get_input
    begin
      continue = false
      puts "Enter the column # you wish to play in"
      input = gets.chomp
      unless input =~ /[1-7]/
        puts "Invalid input!"
        continue = true
      end
    end while (continue)
    input = (input.to_i) - 1 #return array adjusted number
  end

  def victory?
    #Horizontal check
    h = 0
    rcount1 = 0
    rcount2 = 0
    rcount3 = 0
    rcount4 = 0
    rcount5 = 0
    rcount6 = 0
    bcount1 = 0
    bcount2 = 0
    bcount3 = 0
    bcount4 = 0
    bcount5 = 0
    bcount6 = 0
    7.times do
      @board[:first][h] == 'R ' ? rcount1 += 1 : rcount1 = 0
      @board[:second][h] == 'R ' ? rcount2 += 1 : rcount2 = 0
      @board[:third][h] == 'R ' ? rcount3 += 1 : rcount3 = 0
      @board[:fourth][h] == 'R ' ? rcount4 += 1 : rcount4 = 0
      @board[:fifth][h] == 'R ' ? rcount5 += 1 : rcount5 = 0
      @board[:sixth][h] == 'R ' ? rcount6 += 1 : rcount6 = 0
      @board[:first][h] == 'B ' ? bcount1 += 1 : bcount1 = 0
      @board[:second][h] == 'B ' ? bcount2 += 1 : bcount2 = 0
      @board[:third][h] == 'B ' ? bcount3 += 1 : bcount3 = 0
      @board[:fourth][h] == 'B ' ? bcount4 += 1 : bcount4 = 0
      @board[:fifth][h] == 'B ' ? bcount5 += 1 : bcount5 = 0
      @board[:sixth][h] == 'B ' ? bcount6 += 1 : bcount6 = 0
      return true if rcount1 >= 4 or bcount1 >= 4
      return true if rcount2 >= 4 or bcount2 >= 4
      return true if rcount3 >= 4 or bcount3 >= 4
      return true if rcount4 >= 4 or bcount4 >= 4
      return true if rcount5 >= 4 or bcount5 >= 4
      return true if rcount6 >= 4 or bcount6 >= 4
      h += 1
    end
    #Vertical check
    h = 0
    6.times do
      rcount = 0
      bcount = 0
      @board[:first][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:second][h] == 'R ' ? rcount +=1 : rcount = 0
      @board[:third][h] == 'R ' ? rcount +=1 : rcount = 0
      @board[:fourth][h] == 'R ' ? rcount +=1 : rcount = 0
      return true if rcount >= 4
      @board[:fifth][h] == 'R ' ? rcount +=1 : rcount = 0
      return true if rcount >= 4
      @board[:sixth][h] == 'R ' ? rcount +=1 : rcount = 0
      return true if rcount >= 4
      @board[:first][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:second][h] == 'B ' ? bcount +=1 : bcount = 0
      @board[:third][h] == 'B ' ? bcount +=1 : bcount = 0
      @board[:fourth][h] == 'B ' ? bcount +=1 : bcount = 0
      return true if bcount >= 4
      @board[:fifth][h] == 'B ' ? bcount +=1 : bcount = 0
      return true if bcount >= 4
      @board[:sixth][h] == 'B ' ? bcount +=1 : bcount = 0
      return true if bcount >= 4
      h += 1
    end
    #Diagonal check
    h = 0
    4.times do
      rcount = 0
      bcount = 0
      @board[:first][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:second][h+1] == 'R ' ? rcount += 1 : rcount = 0
      @board[:third][h+2] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fourth][h+3] == 'R ' ? rcount += 1 : rcount = 0
      @board[:first][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:second][h+1] == 'B ' ? bcount += 1 : bcount = 0
      @board[:third][h+2] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fourth][h+3] == 'B ' ? bcount += 1 : bcount = 0
      return true if rcount >= 4 or bcount >= 4
      h += 1
    end

    h = 0
    4.times do
      rcount = 0
      bcount = 0
      @board[:second][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:third][h+1] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fourth][h+2] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fifth][h+3] == 'R ' ? rcount += 1 : rcount = 0
      @board[:second][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:third][h+1] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fourth][h+2] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fifth][h+3] == 'B ' ? bcount += 1 : bcount = 0
      return true if rcount >= 4 or bcount >= 4
      h += 1
    end

    h = 0
    4.times do
      rcount = 0
      bcount = 0
      @board[:third][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fourth][h+1] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fifth][h+2] == 'R ' ? rcount += 1 : rcount = 0
      @board[:sixth][h+3] == 'R ' ? rcount += 1 : rcount = 0
      @board[:third][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fourth][h+1] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fifth][h+2] == 'B ' ? bcount += 1 : bcount = 0
      @board[:sixth][h+3] == 'B ' ? bcount += 1 : bcount = 0
      return true if rcount >= 4 or bcount >= 4
      h += 1
    end
    #anti-diagonal
    h = 0
    4.times do
      rcount = 0
      bcount = 0
      @board[:sixth][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fifth][h+1] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fourth][h+2] == 'R ' ? rcount += 1 : rcount = 0
      @board[:third][h+3] == 'R ' ? rcount += 1 : rcount = 0
      @board[:sixth][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fifth][h+1] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fourth][h+2] == 'B ' ? bcount += 1 : bcount = 0
      @board[:third][h+3] == 'B ' ? bcount += 1 : bcount = 0
      return true if rcount >= 4 or bcount >= 4
      h += 1
    end

    h = 0
    4.times do
      rcount = 0
      bcount = 0
      @board[:fifth][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fourth][h+1] == 'R ' ? rcount += 1 : rcount = 0
      @board[:third][h+2] == 'R ' ? rcount += 1 : rcount = 0
      @board[:second][h+3] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fifth][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:fourth][h+1] == 'B ' ? bcount += 1 : bcount = 0
      @board[:third][h+2] == 'B ' ? bcount += 1 : bcount = 0
      @board[:second][h+3] == 'B ' ? bcount += 1 : bcount = 0
      return true if rcount >= 4 or bcount >= 4
      h += 1
    end

    h = 0
    4.times do
      rcount = 0
      bcount = 0
      @board[:fourth][h] == 'R ' ? rcount += 1 : rcount = 0
      @board[:third][h+1] == 'R ' ? rcount += 1 : rcount = 0
      @board[:second][h+2] == 'R ' ? rcount += 1 : rcount = 0
      @board[:first][h+3] == 'R ' ? rcount += 1 : rcount = 0
      @board[:fourth][h] == 'B ' ? bcount += 1 : bcount = 0
      @board[:third][h+1] == 'B ' ? bcount += 1 : bcount = 0
      @board[:second][h+2] == 'B ' ? bcount += 1 : bcount = 0
      @board[:first][h+3] == 'B ' ? bcount += 1 : bcount = 0
      return true if rcount >= 4 or bcount >= 4
      h += 1
    end
    #Check for draw
    count = 0
    h = 0
    7.times do
      count += 1 if @board[:sixth][h] == 'R ' or @board[:sixth][h] == 'B '
      h +=1
    end
    if count == 7
      puts "Draw"
      return true
    end
    false
  end

end
game = Connect_four.new
turn = 0
while(!game.victory?) do
  if turn % 2 == 0
    player_ones_turn = true
  else
    player_ones_turn = false
  end
  game.display
  game.play_piece(player_ones_turn)
  turn += 1
end
game.display
