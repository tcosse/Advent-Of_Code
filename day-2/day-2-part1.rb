file = File.open('day-2-input.txt')
file_data = file.readlines.map(&:chomp)

filtered_data = []

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
    filtered_data << number_of_balls
  end
end

p filtered_data
