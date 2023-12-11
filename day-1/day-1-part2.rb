class String
  def integer?
    Integer(self) != nil rescue false
  end
end

num_list = %w[one two three four five six seven eight nine]

file = File.open('input_ex1.txt')
file_data = file.readlines.map(&:chomp)
sum = 0

file_data.each do |line|
  first_num = nil
  last_num = nil
  i = 0
  until first_num
    if line[i].integer?
      first_num = line[i]
    else
      num_list.each_with_index do |num, index|
        next unless ((i + 1) >= num.length) && (line[i + 1 - num.length, num.length] == num)

        first_num = index + 1
      end
    end
    i += 1
  end

  i = 0
  until last_num
    if line[line.length - i - 1].integer?
      last_num = line[line.length - i - 1]
    else
      num_list.each_with_index do |num, index|
        next unless line[line.length - i - 1, num.length] == num

        last_num = index + 1
      end
    end
    i += 1
  end
  sum += (first_num.to_s + last_num.to_s).to_i
end

puts sum
