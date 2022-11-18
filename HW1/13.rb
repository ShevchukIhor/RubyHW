array = [12, 10, -11, -2, 0, 45, 55, 68, 70, 96, 2, 8]
p 'Дан целочисленный массив:'
p array
p 'Вывести вначале все его четные элементы, а затем - нечетные..'
p "result: #{array.select { |elem| elem.even? } }" + "#{array.select { |elem| elem.odd? }}"
p "result: #{array.partition { |i| i.even?  }.flatten}"
p '_____________________________________________________________'