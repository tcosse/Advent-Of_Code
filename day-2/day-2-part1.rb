def possible_games(games_array, max_red_balls, max_green_balls, max_blue_balls)
  sum_game_ids = 0
  games_array.each_with_index do |game_array, game_index|
    pick_id = 0
    game_possible = true
    puts "Game #{game_index + 1}"
    p game_array
    loop do
      # p game_array[pick_id]
      too_many_green_balls = (game_array[pick_id]["green"].to_i > max_green_balls)
      too_many_red_balls = (game_array[pick_id]["red"].to_i > max_red_balls)
      too_many_blue_balls = (game_array[pick_id]["blue"].to_i > max_blue_balls)
      pick_id += 1
      if too_many_blue_balls || too_many_green_balls || too_many_red_balls
        game_possible = false
        break
      end
      break if pick_id > (game_array.length - 1)
    end
    if game_possible
      p "game #{game_index + 1} possible"
      sum_game_ids += game_index + 1
      p sum_game_ids
    else
      p "game #{game_index + 1} impossible"
    end
  end
  sum_game_ids
end

def parsing_data(file_data)
  parsed_data = []
  colors = %w[red green blue]
  file_data.each do |line|
    game_data =  []
    line.gsub!(/Game \d+:/, '')
    game = line.split(/;/)
    game.each do |pick|
      number_of_balls = {}
      colors.each do |color|
        if pick.match?(color)
          number_of_balls[color] = pick[/(\d+) #{color}/, 1]
        else
          number_of_balls[color] = 0
        end
      end
      game_data << number_of_balls
    end
    parsed_data << game_data
  end
  parsed_data
end

file = File.open('day-2-input.txt')
file_data = file.readlines.map(&:chomp)
# p parsing_data(file_data)
p possible_games(parsing_data(file_data), 12, 13, 14)

#12 red cubes, 13 green cubes, and 14 blue cubes
