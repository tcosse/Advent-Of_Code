def possible_games(data_array, max_green_balls, max_red_balls, max_blue_balls)
  data_array.each do |game_array|
    pick_id = 0
    if game_array[pick_id][color] > max_green_balls

  end
end

def parsing_data(file_data)
  parsed_data = []
  colors = %w[red green blue]
  file_data.each do |line|
    p line
    line.gsub!(/Game \d+:/, '')
    p line
    game = line.split(/;/)
    p game
    game.each do |pick|
      number_of_balls = {}
      colors.each do |color|
        if pick.match?(color)
          number_of_balls[color] = pick[/(\d+) #{color}/, 1]
        else
          number_of_balls[color] = 0
        end
      end
      parsed_data << number_of_balls
    end
  end
  parsed_data
end

file = File.open('day-2-input.txt')
file_data = file.readlines.map(&:chomp)
