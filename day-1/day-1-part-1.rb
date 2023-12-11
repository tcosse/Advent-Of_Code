class String
  def integer?
    Integer(self) != nil rescue false
  end
end

file = File.open('input_ex1.txt')
file_data = file.readlines.map(&:chomp)
sum = 0
file_data.each do |line|
  nums = []
  line.each_char do |char|
    nums << char.to_i if char.integer?
  end
  line_number = nums[0].to_s + nums[-1].to_s
  sum += line_number.to_i
end
puts sum
