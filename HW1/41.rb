array = [100, 12, 10, 120, -1, -2, 0, 45, 120, 55, 68, 120, 70, 96, 2, 8]
p 'Дан целочисленный массив:'
p array
p 'Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'
p "result: #{(0...array.size).partition { |element| element[0].zero? }.flatten.map { |element| array[element] }}"
p '_____________________________________________________________'
