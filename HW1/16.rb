array = [12, 10, -11, -2, 0, 45, 55, 68, 70, 96, 2, 8]
p 'Дан целочисленный массив:'
p array
p 'Найти все нечетные элементы.'
p "result: #{array.select { |e| e.odd? }}"
p '_____________________________________________________________'